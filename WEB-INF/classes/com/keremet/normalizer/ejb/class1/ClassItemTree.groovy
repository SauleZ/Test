package com.keremet.normalizer.ejb.class1

import com.keremet.normalizer.ejb.classnew.ClsTreeAttrs
import kz.statbase.estat.sdata.online.MeasureForClassItem
import kz.statbase.estat.spravgenerator2.model.CatalogVersionService

import javax.persistence.*;

@Entity
@Table(name = "CLASS_ITEM_TREE_ID")
public class ClassItemTree implements Serializable {

    @Id
    @Column(name = "tree_id")
    private Long treeId;
    @Column(name = "id")
    private Long id;
    @Column(name = "par_id")
    private String parId;
    @Column(name = "LINK_ID")
    private Long linkId;
    @Column(name = "class_version_id")
    private Long classVersionId;
    @Column(name = "full_code")
    private String fullCode;
    @Column(name = "order_num")
    private String orderNum;
    @Column(name = "level_code")
    private String levelCode;
    @Column(name = "mes_id")
    private String mesId;
    @Column(name = "edit_type")
    private String editType;
    @Column(name = "vrname")
    private String vrName;
    @Column(name = "vkname")
    private String vkName;
    @Column(name = "vename")
    private String veName;
    @Column(name = "beg_date")
    @Temporal(TemporalType.DATE)
    private Date begDate;
    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
    private Date endDate;
    @Column(name = "pub")
    private Long pub;

    public Long getTreeId() {
        return treeId;
    }

    public void setTreeId(Long treeId) {
        this.treeId = treeId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getParId() {
        return parId;
    }

    public void setParId(String parId) {
        this.parId = parId;
    }

    public String getFullCode() {
        return fullCode;
    }

    public void setFullCode(String fullCode) {
        this.fullCode = fullCode;
    }

    public Long getClassVersionId() {
        return classVersionId;
    }

    public void setClassVersionId(Long classVersionId) {
        this.classVersionId = classVersionId;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getLevelCode() {
        return levelCode;
    }

    public void setLevelCode(String levelCode) {
        this.levelCode = levelCode;
    }

    public String getMesId() {
        return mesId;
    }

    public void setMesId(String mesId) {
        this.mesId = mesId;
    }

    public String getEditType() {
        return editType;
    }

    public void setEditType(String editType) {
        this.editType = editType;
    }

    public String getVrName() {
        return vrName;
    }

    public void setVrName(String vrName) {
        this.vrName = vrName;
    }

    public String getVkName() {
        return vkName;
    }

    public void setVkName(String vkName) {
        this.vkName = vkName;
    }

    public String getVeName() {
        return veName;
    }

    public void setVeName(String veName) {
        this.veName = veName;
    }

    public Date getBegDate() {
        return begDate;
    }

    public void setBegDate(Date begDate) {
        this.begDate = begDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    Long getLinkId() {
        return linkId
    }

    void setLinkId(Long linkId) {
        this.linkId = linkId
    }
    @Transient
    List<ClassItemTreeAttr> theCurrentAttributes

    //TODO add new table in ClassNew
    @Transient
    List<ClsTreeAttrs> theCurrentAttributesNew

    public List<ClassItemTreeAttr> currentAttributes() {
        if (!theCurrentAttributes) {
            theCurrentAttributes = ClassItemTreeAttr.findAll("from ClassItemTreeAttr attr1 " +
                    "where attr1.id.classVersionId= :classId and  attr1.id.treeId= :treeId ",
                    [classId: classVersionId, treeId: treeId])

            //ByAtrStrValue("sssss");
        }
        return theCurrentAttributes;
    }

    public List<ClsTreeAttrs> currentAttributesNew() {
        if (!theCurrentAttributesNew) {
            theCurrentAttributesNew = ClsTreeAttrs.findAll("from ClsTreeAttrs attr1 where attr1.treeId= :treeId ",
                    [treeId: treeId])
        }
        return theCurrentAttributesNew;
    }

    @Transient
    List theMeasureInfo = null;

    List measureInfo(Boolean isNewMeasureMode) {
        if (theMeasureInfo == null) {
            //def result=null;
            String hql2 = " select tree2.fullCode, tree2.vrName , tree2.vkName " +
                    "from ClassItemTree tree1, ClassItemMeasure measure, ClassItemTree tree2 " +
                    "where tree1.classVersionId = :sprav and measure.classVersionId = :sprav " +
                    "and tree2.classVersionId=1098 and tree1.treeId = :id and measure.id = tree1.treeId " +
                    "and measure.mesId=tree2.id and (tree2.pub != 1)  "
            def result = ClassItemTree.executeQuery(hql2, [sprav: classVersionId, id: treeId])

            theMeasureInfo = result

        }
        return theMeasureInfo
    }

}
