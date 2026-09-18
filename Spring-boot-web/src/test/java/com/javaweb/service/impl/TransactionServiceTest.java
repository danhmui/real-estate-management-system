package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class TransactionServiceTest {
    @Mock
    private CustomerRepository customerRepository;

    @Mock
    private TransactionRepository transactionRepository;

    @Mock
    private TransactionConverter  transactionConverter;

    @InjectMocks
    private TransactionService transactionService;

    @Test
    public void testFindAllByCodeAndCustomer_Success(){
        String code = "CSKH";
        Long id = 1L;
        CustomerEntity mockCustomerEntity = new CustomerEntity();
        mockCustomerEntity.setId(id);

        List<TransactionEntity> mockTransactionEntities = new ArrayList<>();
        TransactionEntity mockTransactionEntity = new TransactionEntity();
        mockTransactionEntity.setId(10L);
        mockTransactionEntity.setCode(code);
        mockTransactionEntities.add(mockTransactionEntity);

        TransactionDTO mockTransactionDTO = new TransactionDTO();
        mockTransactionDTO.setId(10L);
        mockTransactionDTO.setCode(code);
        mockTransactionDTO.setNote("Chăm sóc khách hàng");

        when(customerRepository.findCustomerEntityById(id)).thenReturn(mockCustomerEntity);
        when(transactionRepository.findAllByCodeAndCustomerEntity(code,mockCustomerEntity)).thenReturn(mockTransactionEntities);
        when(transactionConverter.toTransactionDTO(mockTransactionEntity)).thenReturn(mockTransactionDTO);

        List<TransactionDTO> results = transactionService.findAllByCodeAndCustomer(code, id);

        assertNotNull(results);
        assertEquals(1, results.size());
        assertEquals("Chăm sóc khách hàng", results.get(0).getNote());

        verify(customerRepository, times(1)).findCustomerEntityById(id);
        verify(transactionRepository, times(1)).findAllByCodeAndCustomerEntity(code,mockCustomerEntity);
        verify(transactionConverter, times(1)).toTransactionDTO(mockTransactionEntity);
    }

    @Test
    public void testDeleteTransaction_Success(){
        Long id = 1L;
        doNothing().when(transactionRepository).deleteById(id);
        transactionService.deleteTransaction(id);
        verify(transactionRepository, times(1)).deleteById(id);
    }

    @Test
    public void testCreateOrUpdateTransaction_Create(){
        TransactionEntity mockTransactionEntity = new TransactionEntity();
        mockTransactionEntity.setNote("Dẫn đi xem");

        TransactionDTO mockTransactionDTO = new TransactionDTO();

        when(transactionConverter.toTransactionEntity(mockTransactionDTO)).thenReturn(mockTransactionEntity);
        when(transactionRepository.save(mockTransactionEntity)).thenReturn(mockTransactionEntity);

        transactionService.createOrUpdateTransaction(mockTransactionDTO);

        verify(transactionConverter, times(1)).toTransactionEntity(mockTransactionDTO);
        verify(transactionRepository, times(1)).save(mockTransactionEntity);
    }

    @Test
    public void testCreateOrUpdateTransaction_Update(){
        TransactionEntity mockTransactionEntity = new TransactionEntity();
        mockTransactionEntity.setId(5L);
        mockTransactionEntity.setNote("Dẫn đi xem");

        TransactionDTO mockTransactionDTO = new TransactionDTO();
        mockTransactionDTO.setId(5L);
        mockTransactionDTO.setNote("Cập nhật lại lịch hẹn dẫn khách");

        when(transactionRepository.findTransactionEntityById(mockTransactionDTO.getId())).thenReturn(mockTransactionEntity);
        when(transactionRepository.save(mockTransactionEntity)).thenReturn(mockTransactionEntity);

        transactionService.createOrUpdateTransaction(mockTransactionDTO);

        assertEquals("Cập nhật lại lịch hẹn dẫn khách",  mockTransactionEntity.getNote());
        verify(transactionRepository, times(1)).findTransactionEntityById(mockTransactionDTO.getId());
        verify(transactionRepository, times(1)).save(mockTransactionEntity);
    }


}
