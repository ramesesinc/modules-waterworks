package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;
import java.text.*;


public class BatchProgressModel {
   
    @Binding
    def binding;

    def totalcount = 0;
    def counter = 0;

    def currentProcessor;
    def label;
    boolean processing = false;
    boolean started = false;
    int sleepTime = 500;

    //batch handler must have a process, onFinish and onCancel
    def batchHandler;

    def progressBar = [
        getMaxValue: {
            return totalcount;
        },
        getValue: {
            return counter;
        }
    ] as ProgressModel;

    public void start() {
        if(totalcount == 0) throw new Exception("batch progress totalcount must be greater than zero");
        if(!batchHandler) throw new Exception("batch progress batchHandler must be provided");
        
        processing = true;
        started = true;
        currentProcessor = [
            getTotalCount: {
                return totalcount;
            },
            fetchList: { o->
                //returns the processed count.
                int sz = batchHandler.process(o);
                Thread.sleep(sleepTime); //this was added so it will not hog the resources
                if( sz ==0 ) {
                    return null;
                }
                else {
                    counter = counter + sz;
                    return [[size: sz]];                    
                }
            },
            processItem: { o->
                label =  "processing " + counter +" of " + totalcount;
                progressBar.refresh();
                binding.refresh('label');
            },
            afterCancel: {
                processing = false;
            },
            onFinished: {
                batchHandler.onFinish();
                binding.fireNavigation( "_close" );
            }
        ] as BatchProcessingModel;
        currentProcessor.start();        
    }

    void cancelProcess() {
        if(!MsgBox.confirm("Cancel process?")) return;
        currentProcessor.cancel();
    }

    void resumeProcess() {
        currentProcessor.start();
        processing = true;
    }

    
}