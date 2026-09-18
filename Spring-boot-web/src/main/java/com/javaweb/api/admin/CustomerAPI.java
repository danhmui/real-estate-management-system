package com.javaweb.api.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.dto.CustomerResponseDTO;
import com.javaweb.dto.StaffResponseDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.impl.CustomerService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping("/customers/{id}/staffs")
    public ResponseEntity<Map<String, Object>> getCustomerStaffs(@PathVariable Long id){
        Map<String, Object> response = new HashMap<>();
        List<StaffResponseDTO> staffResponseDTOS = userService.getStaffsAssignmentCustomer(id);
        response.put("data", staffResponseDTOS);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/customer-edit")
    public ResponseEntity<?> addOrEditCustomer(@Valid @RequestBody CustomerDTO customerDTO,
                                               BindingResult result){
        try{
            if(result.hasErrors()){
                List<String> erros = result.getFieldErrors().stream().map(FieldError::getDefaultMessage)
                        .collect(Collectors.toList());
                return ResponseEntity.badRequest().body(erros);
            }
            if (customerDTO.getId() != null && !SecurityUtils.getAuthorities().contains(SystemConstant.MANAGER_ROLE)) {
                Long currentStaffId = SecurityUtils.getPrincipal().getId();

                if (!customerRepository.existsByIdAndUserEntities_Id(customerDTO.getId(), currentStaffId)) {
                    return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Không có quyền sửa khách hàng này!");
                }
            }
            CustomerResponseDTO customerResponseDTO =  customerService.addOrEditCustomer(customerDTO);
            return ResponseEntity.ok(customerResponseDTO);
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body("Hệ thống gặp lỗi " + e.getMessage());
        }
    }


    @DeleteMapping("/customer-list")
    public ResponseEntity<?> deleteCustomers(@RequestBody List<Long> ids){
        if(ids != null){
            customerService.deleteCustomers(ids);
        }
        return ResponseEntity.ok().build();
    }

    @PostMapping("/customerassignments")
    public ResponseEntity<?> updateAssignment(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        customerService.updateAssignment(assignmentCustomerDTO);
        return ResponseEntity.ok().build();
    }
}
