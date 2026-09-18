package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.dto.BuildingResponseDTO;
//import com.javaweb.entity. BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.impl.BuildingService;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.BuildingType;
import com.javaweb.utils.DisplayTagUtils;
import com.javaweb.utils.DistrictCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private UserService userService;

    @Autowired
    private BuildingService buildingService;


    @GetMapping("/admin/building-list")
    public ModelAndView getBuilding(@ModelAttribute("modelSearch") BuildingSearchRequest params, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/list");
        DisplayTagUtils.of(request, params);
        List<BuildingResponseDTO> results = buildingService.findAll(params, PageRequest.of(params.getPage() - 1, params.getMaxPageItems()));
        mav.addObject("buildingList", results);
        params.setListResult(results);

        params.setTotalItem(buildingService.countTotalItem());
        mav.addObject(SystemConstant.MODEL, params);

        //Lay danh sach nhan vien
        Map<Long, String> staffList = userService.getListStaff();
        mav.addObject("staffList", staffList);

        //Lay danh sach quan
        mav.addObject("districts", DistrictCode.getDistrict());

        //Lay danh sach loai toa nha
        mav.addObject("typeList", BuildingType.getBuildingType());
        //Set role cho nguoi dang nhap dung de phan quyen hien thi
        if(SecurityUtils.getAuthorities().contains(SystemConstant.STAFF_ROLE)){
            Long staffId = SecurityUtils.getPrincipal().getId();
            params.setStaffId(staffId);
        }
        return mav;
    }

    @GetMapping("/admin/building-edit")
    public ModelAndView addOrUpdateBuilding(@RequestParam(required = false) Long id){
        ModelAndView mav = new  ModelAndView("admin/building/edit");
        if(id != null && !SecurityUtils.getAuthorities().contains(SystemConstant.MANAGER_ROLE))
            return new ModelAndView("redirect:/access-denied");
        mav.addObject("districts", DistrictCode.getDistrict());
        mav.addObject("typeList", BuildingType.getBuildingType());

        if(id != null) {
            BuildingDTO data = buildingService.findBuildingById(id);
            mav.addObject("modelInsertOrUpdate", data);
            mav.addObject("mode", "update");
        }else{
            mav.addObject("modelInsertOrUpdate", new BuildingDTO());
            mav.addObject("mode","insert");
        }

        return mav;
    }

}
