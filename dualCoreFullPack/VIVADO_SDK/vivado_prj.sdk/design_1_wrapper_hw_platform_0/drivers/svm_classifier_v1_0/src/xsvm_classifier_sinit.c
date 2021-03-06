// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsvm_classifier.h"

extern XSvm_classifier_Config XSvm_classifier_ConfigTable[];

XSvm_classifier_Config *XSvm_classifier_LookupConfig(u16 DeviceId) {
	XSvm_classifier_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSVM_CLASSIFIER_NUM_INSTANCES; Index++) {
		if (XSvm_classifier_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSvm_classifier_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSvm_classifier_Initialize(XSvm_classifier *InstancePtr, u16 DeviceId) {
	XSvm_classifier_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSvm_classifier_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSvm_classifier_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

