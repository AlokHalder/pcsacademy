package in.pcsacademy.exception;

import java.io.Serializable;

public class PCSAcademyServiceException extends Exception implements Serializable {

    private String errorCode = null;
    private String errorMessage = null;

    public PCSAcademyServiceException(String errorCode, String errorMessage) {
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
    }

    @Override
    public String toString() {
        String msg = errorCode + " " + errorMessage;
        return msg;
    }

}
