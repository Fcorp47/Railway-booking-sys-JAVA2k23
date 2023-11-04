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
public class PassModel {
    
 //   PID	PNR	UID	PassName	PassAge	PassGender	Class	CoachNo	SeatNo	Berth	

    private int PID;
    private int PNR;
    private int UID;
    private String passname;
    private String passage;
    private String passgender;
    private String coachclass;
    private String coachno;
    private String seatno;
    private String berth;

    public int getPID() {
        return PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }

    public int getPNR() {
        return PNR;
    }

    public void setPNR(int PNR) {
        this.PNR = PNR;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public String getPassname() {
        return passname;
    }

    public void setPassname(String passname) {
        this.passname = passname;
    }

    public String getPassage() {
        return passage;
    }

    public void setPassage(String passage) {
        this.passage = passage;
    }

    public String getPassgender() {
        return passgender;
    }

    public void setPassgender(String passgender) {
        this.passgender = passgender;
    }

    public String getCoachclass() {
        return coachclass;
    }

    public void setCoachclass(String coachclass) {
        this.coachclass = coachclass;
    }

    public String getCoachno() {
        return coachno;
    }

    public void setCoachno(String coachno) {
        this.coachno = coachno;
    }

    public String getSeatno() {
        return seatno;
    }

    public void setSeatno(String seatno) {
        this.seatno = seatno;
    }

    public String getBerth() {
        return berth;
    }

    public void setBerth(String berth) {
        this.berth = berth;
    }
    
}
