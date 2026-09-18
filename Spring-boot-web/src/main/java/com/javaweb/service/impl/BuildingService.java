package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.dto.BuildingResponseDTO;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.IBuildingService;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingService implements IBuildingService {
    @Autowired
    AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    RentAreaRepository rentAreaRepository;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private UploadFileUtils uploadFileUtils;

    @Override
    public BuildingResponseDTO createOrUpdateBuilding(BuildingDTO buildingDTO) {
        if(!SecurityUtils.getAuthorities().contains(SystemConstant.MANAGER_ROLE))
            throw new RuntimeException("Nhân viên không có quyền chỉnh sửa tòa nhà!");
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntity(buildingDTO);
        saveThumbnail(buildingDTO, buildingEntity);
        if(buildingDTO.getId() != null)
            rentAreaRepository.deleteByBuildingEntity(buildingEntity);
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        String[] values = buildingDTO.getRentArea().split(",");
        for(String value : values){
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setBuildingEntity(buildingEntity);
            rentAreaEntity.setValue(Long.parseLong(value.trim()));
            rentAreaEntities.add(rentAreaEntity);
        }
        buildingEntity.setRentAreaEntities(rentAreaEntities);
        buildingRepository.save(buildingEntity);
        return buildingConverter.toBuildingResponseDTO(buildingEntity);
    }

    public void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity){
        String path = "/building/" + buildingDTO.getImageName();
        if(buildingDTO.getImageBase64() != null){
            if(buildingEntity.getImage() != null){
                if(!path.equals(buildingEntity.getImage())){
                    File file = new File("D://home" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setImage(path);
        }
    }

    @Override
    public BuildingDTO findBuildingById(long id) {
        BuildingEntity buildingEntity = buildingRepository.findBuildingEntityById(id);
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        if(buildingEntity != null && !buildingEntity.getType().isEmpty()){
            String typeStr = buildingEntity.getType();
            if(!typeStr.isEmpty()){
                List<String> typeList = Arrays.asList(typeStr.split(","));
                buildingDTO.setType(typeList);
            }
        }

        if(buildingEntity.getRentAreaEntities() != null &&  !buildingEntity.getRentAreaEntities().isEmpty()){
            List<String> values = buildingEntity.getRentAreaEntities().stream()
                    .map(i -> String.valueOf(i.getValue())).collect(Collectors.toList());
            String value = String.join(",", values);
            buildingDTO.setRentArea(value);
        }
        return buildingDTO;
    }

    @Override
    public void deleteBuildingEntityById(Long id) {
        rentAreaRepository.deleteByBuildingEntity_Id(id);
        buildingRepository.deleteBuildingEntityById(id);
    }

    @Override
    public void deleteAllBuildingEntitiesByIdIn(List<Long> ids) {
        for(Long id : ids){
            assignmentBuildingRepository.deleteByBuilding_Id(id);
            rentAreaRepository.deleteByBuildingEntity_Id(id);
            buildingRepository.deleteBuildingEntityById(id);
        }
    }

    @Override
    public void deleteAssignmentBuildingEntitiesByIdIn(Long id) {
        buildingRepository.deleteBuildingEntityById(id);
    }

    @Override
    public void assignStaffs(Long buildingId, List<Long> staffIds) {
        BuildingEntity buildingEntity =  buildingRepository.findBuildingEntityById(buildingId);

        assignmentBuildingRepository.deleteAssignmentBuildingEntityById(buildingId);
        if(staffIds != null && !staffIds.isEmpty()){
            for(Long staffId : staffIds){
                AssignmentBuildingEntity building = new AssignmentBuildingEntity();
                building.setBuilding(buildingEntity);
                building.setStaffId(staffId);
                assignmentBuildingRepository.save(building);
            }
        }
    }

    @Override
    public void updateAssignment(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findBuildingEntityById(assignmentBuildingDTO.getBuildingId());
        if(buildingEntity != null){
            assignmentBuildingRepository.deleteByBuilding(buildingEntity);
            if(assignmentBuildingDTO.getStaffIds() != null  && !assignmentBuildingDTO.getStaffIds().isEmpty()) {
                for (Long staffId : assignmentBuildingDTO.getStaffIds()) {
                    AssignmentBuildingEntity building = new AssignmentBuildingEntity();
                    building.setBuilding(buildingEntity);
                    building.setStaffId(staffId);
                    assignmentBuildingRepository.save(building);
                }
            }
        }
    }

    @Override
    public List<BuildingResponseDTO> findAll(BuildingSearchRequest params, Pageable pageable) {
        Long currentUserId = SecurityUtils.getPrincipal().getId();
        if(!SecurityUtils.getAuthorities().contains(SystemConstant.MANAGER_ROLE))
            params.setStaffId(currentUserId);
        BuildingSearchBuilder builder = buildingConverter.toBuildingSearchBuilder(params);
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(builder, pageable);
        List<BuildingResponseDTO> list = new ArrayList<>();
        for (BuildingEntity buildingEntity : buildingEntities) {
            BuildingResponseDTO buildingResponseDTO = buildingConverter.toBuildingResponseDTO(buildingEntity);
            list.add(buildingResponseDTO);
        }
        return list;
    }

    @Override
    public int countTotalItem() {
        return buildingRepository.countTotalItem();
    }
}
