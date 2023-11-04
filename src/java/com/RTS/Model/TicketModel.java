/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.RTS.Model;

/**
 *
 * @author Asus
 */
public class TicketModel {

    public String getArrivaltime() {
        return arrivaltime;
    }

    public void setArrivaltime(String arrivaltime) {
        this.arrivaltime = arrivaltime;
    }

    public String getDeparttime() {
        return departtime;
    }

    public void setDeparttime(String departtime) {
        this.departtime = departtime;
    }
    
    //ID	PNR	TID	UID	BookedOn	Dateofboard	Class	Boardingstation	Deststation	Status	TotalAmount	

    private int ID;
    private int PNR;
    private int TID;
    private int UID;
    private String BookDate;
    private String Dateofboard;
    private String CoachClass;
    private String Boardingstation;
    private String Deststation;
    private String Status;
    private float TotalAmount;
    private String tname;
    private String arrivaltime;
    private String departtime;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getPNR() {
        return PNR;
    }

    public void setPNR(int PNR) {
        this.PNR = PNR;
    }

    public int getTID() {
        return TID;
    }

    public void setTID(int TID) {
        this.TID = TID;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public String getBookDate() {
        return BookDate;
    }

    public void setBookDate(String BookDate) {
        this.BookDate = BookDate;
    }

    public String getDateofboard() {
        return Dateofboard;
    }

    public void setDateofboard(String Dateofboard) {
        this.Dateofboard = Dateofboard;
    }

    public String getCoachClass() {
        return CoachClass;
    }

    public void setCoachClass(String CoachClass) {
        this.CoachClass = CoachClass;
    }

    public String getBoardingstation() {
        return Boardingstation;
    }

    public void setBoardingstation(String Boardingstation) {
        this.Boardingstation = Boardingstation;
    }

    public String getDeststation() {
        return Deststation;
    }

    public void setDeststation(String Deststation) {
        this.Deststation = Deststation;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public float getTotalAmount() {
        return TotalAmount;
    }

    public void setTotalAmount(float TotalAmount) {
        this.TotalAmount = TotalAmount;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    
}
