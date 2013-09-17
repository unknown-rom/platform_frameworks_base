/*
 * Copyright (C) 2013 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.print;

import android.content.ComponentName;
import android.os.ParcelFileDescriptor;
import android.print.IPrintDocumentAdapter;
import android.print.IPrintClient;
import android.print.IPrintSpoolerClient;
import android.print.IPrintSpoolerCallbacks;
import android.print.PrinterInfo;
import android.print.PrintAttributes;
import android.print.PrintJobId;
import android.print.PrintJobInfo;

/**
 * Interface for communication with the print spooler service.
 *
 * @see android.print.IPrintSpoolerCallbacks
 *
 * @hide
 */
oneway interface IPrintSpooler {
    void removeObsoletePrintJobs();
    void forgetPrintJobs(in List<PrintJobId> printJob);
    void getPrintJobInfos(IPrintSpoolerCallbacks callback, in ComponentName componentName,
            int state, int appId, int sequence);
    void getPrintJobInfo(in PrintJobId printJobId, IPrintSpoolerCallbacks callback,
            int appId, int sequence);
    void createPrintJob(in PrintJobInfo printJob, in IPrintClient client,
            in IPrintDocumentAdapter printAdapter);
    void setPrintJobState(in PrintJobId printJobId, int status, String stateReason,
            IPrintSpoolerCallbacks callback, int sequence);
    void setPrintJobTag(in PrintJobId printJobId, String tag, IPrintSpoolerCallbacks callback,
            int sequence);
    void writePrintJobData(in ParcelFileDescriptor fd, in PrintJobId printJobId);
    void setClient(IPrintSpoolerClient client);
}
