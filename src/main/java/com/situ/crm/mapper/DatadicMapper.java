package com.situ.crm.mapper;

import com.situ.crm.pojo.Datadic;
import com.situ.crm.pojo.DatadicExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DatadicMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    int countByExample(DatadicExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    int deleteByExample(DatadicExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    int insert(Datadic record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    int insertSelective(Datadic record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    List<Datadic> selectByExample(DatadicExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    Datadic selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    int updateByExampleSelective(@Param("record") Datadic record, @Param("example") DatadicExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    int updateByExample(@Param("record") Datadic record, @Param("example") DatadicExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    int updateByPrimaryKeySelective(Datadic record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table datadic
     *
     * @mbggenerated Thu Oct 26 11:27:07 CST 2017
     */
    int updateByPrimaryKey(Datadic record);
}