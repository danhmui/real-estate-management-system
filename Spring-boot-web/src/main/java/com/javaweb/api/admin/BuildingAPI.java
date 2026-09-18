package com.javaweb.api.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.dto.BuildingResponseDTO;
import com.javaweb.dto.StaffResponseDTO;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.service.impl.BuildingService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/admin")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private UserService userService;

    @PostMapping("/building-edit")
    public ResponseEntity<?> createOrUpdateBuilding(@Valid @RequestBody BuildingDTO buildingDTO,
                                                    BindingResult result){
        try{
            if(result.hasErrors()){
                List<String> errors = result.getFieldErrors().stream().map(FieldError::getDefaultMessage)
                        .collect(Collectors.toList());
                return ResponseEntity.badRequest().body(errors);
            }
            BuildingResponseDTO buildingResponseDTO = buildingService.createOrUpdateBuilding(buildingDTO);
            return ResponseEntity.ok(buildingResponseDTO);
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(SystemConstant.ERROR_SYSTEM);
        }
    }

    @DeleteMapping("/building-list")
    public ResponseEntity<?> deleteBuildings(@RequestBody List<Long> ids){
        if(ids != null){
            buildingService.deleteAllBuildingEntitiesByIdIn(ids);
        }
        return ResponseEntity.ok(SystemConstant.DELETE_SUCCESS);
    }


    @GetMapping("/buildings/{id}/staffs")
    public ResponseEntity<Map<String, Object>> getBuildingStaffs(@PathVariable Long id){
        List<StaffResponseDTO> staffResponseDTOS = userService.getStaffsAssignmentBuilding(id);
        //Chuyen du lieu ra ben client
        Map<String, Object> response = new HashMap<>();
        response.put("data", staffResponseDTOS);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/buildingassignments")
    public ResponseEntity<?> updateAssignment(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        buildingService.updateAssignment(assignmentBuildingDTO);
        return ResponseEntity.ok(SystemConstant.UPDATE_SUCCESS);
    }
}

