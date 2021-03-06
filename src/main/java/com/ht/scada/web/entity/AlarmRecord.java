package com.ht.scada.web.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.ht.scada.common.tag.entity.EndTag;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "T_Alarm_Record")
public class AlarmRecord extends AbstractPersistable<Integer> {

    /**
     *
     */
    private static final long serialVersionUID = -7462892564700833086L;
    @Column(nullable = false, unique = true)
    private String alarmId;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "endtag_id")
    private EndTag endTag;
    @Column(name = "alarm_type")
    private String alarmType;	//报警类型
    @Column(name = "var_name")
    private String varName;		//变量名（英文）
    private String varCnName;   //变量名中文名

    private String info;		//故障信息
    private String remark;		//备注 详细信息
    @Column(name = "action_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date actionTime;
    @Column(name = "resume_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date resumeTime;
    private int status = 0;	//0未解除，1解除
    @OneToMany(mappedBy = "alarmRecord")
    private List<AlarmHandle> alarmHandleList;

    public String getAlarmId() {
        return alarmId;
    }

    public void setAlarmId(String alarmId) {
        this.alarmId = alarmId;
    }

    public EndTag getEndTag() {
        return endTag;
    }

    public void setEndTag(EndTag endTag) {
        this.endTag = endTag;
    }

    public String getAlarmType() {
        return alarmType;
    }

    public void setAlarmType(String alarmType) {
        this.alarmType = alarmType;
    }

    public String getVarName() {
        return varName;
    }

    public void setVarName(String varName) {
        this.varName = varName;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getActionTime() {
        return actionTime;
    }

    public void setActionTime(Date actionTime) {
        this.actionTime = actionTime;
    }

    public Date getResumeTime() {
        return resumeTime;
    }

    public void setResumeTime(Date resumeTime) {
        this.resumeTime = resumeTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<AlarmHandle> getAlarmHandleList() {
        return alarmHandleList;
    }

    public void setAlarmHandleList(List<AlarmHandle> alarmHandleList) {
        this.alarmHandleList = alarmHandleList;
    }

    public String getVarCnName() {
        return varCnName;
    }

    public void setVarCnName(String varCnName) {
        this.varCnName = varCnName;
    }

}
