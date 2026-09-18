package com.javaweb.service.impl;

import com.javaweb.converter.UserConverter;
import com.javaweb.dto.StaffResponseDTO;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.exception.MyException;
import com.javaweb.model.dto.PasswordDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceTest {
    @Mock
    private UserConverter userConverter;

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private CustomerRepository customerRepository;

    @InjectMocks
    private UserService userService;

    @Test
    public void testUpdatePassword_Success() throws MyException {
        Long userId = 10L;
        PasswordDTO mockPasswordDTO = new PasswordDTO();
        mockPasswordDTO.setNewPassword("abcdef");
        mockPasswordDTO.setConfirmPassword("abcdef");
        mockPasswordDTO.setOldPassword("123456");

        UserEntity mockUserEntity = new UserEntity();
        mockUserEntity.setPassword("encodedOldPassword");
        mockUserEntity.setId(userId);

        when(userRepository.findById(userId)).thenReturn(Optional.of(mockUserEntity));
        when(passwordEncoder.matches(mockPasswordDTO.getOldPassword(), mockUserEntity.getPassword())).thenReturn(true);
        when(passwordEncoder.encode(mockPasswordDTO.getNewPassword())).thenReturn("encodedNewPassword");
        when(userRepository.save(mockUserEntity)).thenReturn(mockUserEntity);

        userService.updatePassword(userId, mockPasswordDTO);

        assertEquals("encodedNewPassword", mockUserEntity.getPassword());
        verify(userRepository, times(1)).findById(userId);
        verify(passwordEncoder, times(1)).matches("123456", "encodedOldPassword");
        verify(userRepository, times(1)).save(mockUserEntity);
    }

    @Test(expected =  MyException.class)
    public void testUpdatePassword_WrongOldPassword() throws MyException {
        Long userId = 10L;
        PasswordDTO mockPasswordDTO = new PasswordDTO();
        mockPasswordDTO.setOldPassword("wrongOldPassword");
        mockPasswordDTO.setNewPassword("abcdef");
        mockPasswordDTO.setConfirmPassword("abcdef");

        UserEntity mockUserEntity = new UserEntity();
        mockUserEntity.setId(userId);
        mockUserEntity.setPassword("encodedOldPassword");

        when(userRepository.findById(userId)).thenReturn(Optional.of(mockUserEntity));
        when(passwordEncoder.matches(mockPasswordDTO.getOldPassword(), mockUserEntity.getPassword())).thenReturn(false);

        userService.updatePassword(userId, mockPasswordDTO);

    }

    @Test
    public void testGetStaffsAssignmentCustomer_Success(){
        Long customerId = 10L;
        String roleCode = "STAFF";

        UserEntity user1 = new UserEntity();
        user1.setId(10L);
        user1.setFullName("nguyen van a");

        UserEntity user2 = new UserEntity();
        user2.setId(20L);
        user2.setFullName("nguyen van b");
        List<UserEntity> allStaffs = Arrays.asList(user1, user2);

        CustomerEntity customerEntity = new CustomerEntity();
        customerEntity.setId(customerId);
        customerEntity.setUserEntities(Collections.singletonList(user1));

        when(userRepository.findByStatusAndRoles_Code(1L, roleCode)).thenReturn(allStaffs);
        when(customerRepository.findCustomerEntityById(10L)).thenReturn(customerEntity);

        List<StaffResponseDTO> results = userService.getStaffsAssignmentCustomer(customerId);

        assertNotNull(results);
        assertEquals(2, results.size());
        assertEquals("checked", results.get(0).getChecked());
        assertEquals("", results.get(1).getChecked());

        verify(userRepository, times(1)).findByStatusAndRoles_Code(1L, "STAFF");
        verify(customerRepository, times(1)).findCustomerEntityById(customerId);
    }


    @Test
    public void testFindOneByUserNameAndStatus_Sucess(){
        UserEntity mockUserEntity = new UserEntity();
        mockUserEntity.setUserName("Lã Ngọc Chiến");
        mockUserEntity.setStatus(1L);

        UserDTO mockUserDTO = new UserDTO();
        mockUserDTO.setUserName(mockUserEntity.getUserName());
        mockUserDTO.setStatus(mockUserEntity.getStatus());

        when(userRepository.findOneByUserNameAndStatus(mockUserEntity.getUserName(), mockUserEntity.getStatus())).thenReturn(mockUserEntity);
        when(userConverter.convertToDto(mockUserEntity)).thenReturn(mockUserDTO);

        userService.findOneByUserNameAndStatus(mockUserEntity.getUserName(), mockUserEntity.getStatus());

        assertEquals("Lã Ngọc Chiến", mockUserDTO.getUserName());
        verify(userRepository, times(1)).findOneByUserNameAndStatus(mockUserEntity.getUserName(), mockUserEntity.getStatus());
        verify(userConverter, times(1)).convertToDto(mockUserEntity);
    }
}
