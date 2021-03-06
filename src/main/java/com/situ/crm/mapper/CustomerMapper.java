package com.situ.crm.mapper;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.pojo.Customer;
import com.situ.crm.pojo.CustomerExample;
import com.situ.crm.vo.CustomerConstitue;
import com.situ.crm.vo.CustomerContribute;
import com.situ.crm.vo.CustomerServiceType;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CustomerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    int countByExample(CustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    int deleteByExample(CustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    int insert(Customer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    int insertSelective(Customer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    List<Customer> selectByExample(CustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    Customer selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    int updateByExampleSelective(@Param("record") Customer record, @Param("example") CustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    int updateByExample(@Param("record") Customer record, @Param("example") CustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    int updateByPrimaryKeySelective(Customer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    int updateByPrimaryKey(Customer record);

    //查找最近六个月的流失客户
	List<Customer> findLossCustomer();

	List<CustomerContribute> findCustomerContribute(Map<String, Object> map);

	List<CustomerConstitue> findCustomerConstitute();

	List<CustomerServiceType> findCustomerServiceType();
}