package com.situ.crm.pojo;

import java.util.Date;

public class SaleChance {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.id
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.chance_source
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private String chanceSource;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.customer_name
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private String customerName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.success_rate
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private Integer successRate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.overview
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private String overview;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.link_man
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private String linkMan;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.link_phone
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private String linkPhone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.description
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private String description;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.create_man
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private String createMan;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.create_time
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private Date createTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.assign_man
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private String assignMan;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.assign_time
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private Date assignTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.status
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private Integer status;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sale_chance.dev_result
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    private Integer devResult;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.id
     *
     * @return the value of sale_chance.id
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.id
     *
     * @param id the value for sale_chance.id
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.chance_source
     *
     * @return the value of sale_chance.chance_source
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public String getChanceSource() {
        return chanceSource;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.chance_source
     *
     * @param chanceSource the value for sale_chance.chance_source
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setChanceSource(String chanceSource) {
        this.chanceSource = chanceSource == null ? null : chanceSource.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.customer_name
     *
     * @return the value of sale_chance.customer_name
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.customer_name
     *
     * @param customerName the value for sale_chance.customer_name
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.success_rate
     *
     * @return the value of sale_chance.success_rate
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public Integer getSuccessRate() {
        return successRate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.success_rate
     *
     * @param successRate the value for sale_chance.success_rate
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setSuccessRate(Integer successRate) {
        this.successRate = successRate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.overview
     *
     * @return the value of sale_chance.overview
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public String getOverview() {
        return overview;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.overview
     *
     * @param overview the value for sale_chance.overview
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setOverview(String overview) {
        this.overview = overview == null ? null : overview.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.link_man
     *
     * @return the value of sale_chance.link_man
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public String getLinkMan() {
        return linkMan;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.link_man
     *
     * @param linkMan the value for sale_chance.link_man
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan == null ? null : linkMan.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.link_phone
     *
     * @return the value of sale_chance.link_phone
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public String getLinkPhone() {
        return linkPhone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.link_phone
     *
     * @param linkPhone the value for sale_chance.link_phone
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setLinkPhone(String linkPhone) {
        this.linkPhone = linkPhone == null ? null : linkPhone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.description
     *
     * @return the value of sale_chance.description
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public String getDescription() {
        return description;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.description
     *
     * @param description the value for sale_chance.description
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.create_man
     *
     * @return the value of sale_chance.create_man
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public String getCreateMan() {
        return createMan;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.create_man
     *
     * @param createMan the value for sale_chance.create_man
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setCreateMan(String createMan) {
        this.createMan = createMan == null ? null : createMan.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.create_time
     *
     * @return the value of sale_chance.create_time
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.create_time
     *
     * @param createTime the value for sale_chance.create_time
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.assign_man
     *
     * @return the value of sale_chance.assign_man
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public String getAssignMan() {
        return assignMan;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.assign_man
     *
     * @param assignMan the value for sale_chance.assign_man
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setAssignMan(String assignMan) {
        this.assignMan = assignMan == null ? null : assignMan.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.assign_time
     *
     * @return the value of sale_chance.assign_time
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public Date getAssignTime() {
        return assignTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.assign_time
     *
     * @param assignTime the value for sale_chance.assign_time
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setAssignTime(Date assignTime) {
        this.assignTime = assignTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.status
     *
     * @return the value of sale_chance.status
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.status
     *
     * @param status the value for sale_chance.status
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sale_chance.dev_result
     *
     * @return the value of sale_chance.dev_result
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public Integer getDevResult() {
        return devResult;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sale_chance.dev_result
     *
     * @param devResult the value for sale_chance.dev_result
     *
     * @mbggenerated Mon Oct 30 14:01:59 CST 2017
     */
    public void setDevResult(Integer devResult) {
        this.devResult = devResult;
    }
}