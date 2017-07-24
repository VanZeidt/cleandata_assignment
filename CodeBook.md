Codebook 
========

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals time_accelerometer_xyz and time_gyroscope_xyz. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time_body_accelerometer_xyz and time_gravity_accelerometer_xyz) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time_body_accelerometer_jerk_xyz and time_body_gyroscope_jerk_xyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time_body_accelerometer_mag, time_gravity_accelerometer_mag, time_body_accelerometer_jerk_mag, time_body_gyroscope_mag, time_body_gyroscope_jerk_mag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freq_body_accelerometer_xyz, freq_body_accelerometer_jerk_xyz, freq_body_gyroscope_xyz, freq_body_accelerometer_jerk_mag, freq_body_gyroscope_mag, freq_body_gyroscope_jerk_mag. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_xyz' is used to denote 3-axial signals in the X, Y and Z directions.

**The set of variables that were estimated from these signals are:**

mean: Mean value
std: Standard deviation

**3 additional variables of the dataset are:**
subject: An identifier of the subject who carried out the experiment.
activity: Activity label, one of LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
dataset: Test or training, to identify the original dataset


**The complete list of variables of each feature vector are the following:**

time_body_accelerometer_mean_x  
time_body_accelerometer_mean_y  
time_body_accelerometer_mean_z  
time_body_accelerometer_stdev_x  
time_body_accelerometer_stdev_y  
time_body_accelerometer_stdev_z  
time_gravity_accelerometer_mean_x  
time_gravity_accelerometer_mean_y  
time_gravity_accelerometer_mean_z  
time_gravity_accelerometer_stdev_x  
time_gravity_accelerometer_stdev_y  
time_gravity_accelerometer_stdev_z  
time_body_accelerometer_jerk_mean_x  
time_body_accelerometer_jerk_mean_y  
time_body_accelerometer_jerk_mean_z  
time_body_accelerometer_jerk_stdev_x  
time_body_accelerometer_jerk_stdev_y  
time_body_accelerometer_jerk_stdev_z  
time_body_gyroscope_mean_x  
time_body_gyroscope_mean_y  
time_body_gyroscope_mean_z  
time_body_gyroscope_stdev_x  
time_body_gyroscope_stdev_y  
time_body_gyroscope_stdev_z  
time_body_gyroscope_jerk_mean_x  
time_body_gyroscope_jerk_mean_y  
time_body_gyroscope_jerk_mean_z  
time_body_gyroscope_jerk_stdev_x  
time_body_gyroscope_jerk_stdev_y  
time_body_gyroscope_jerk_stdev_z  
time_body_accelerometer_mag_mean  
time_body_accelerometer_mag_stdev  
time_gravity_accelerometer_mag_mean  
time_gravity_accelerometer_mag_stdev  
time_body_accelerometer_jerk_mag_mean  
time_body_accelerometer_jerk_mag_stdev  
time_body_gyroscope_mag_mean  
time_body_gyroscope_mag_stdev  
time_body_gyroscope_jerk_mag_mean  
time_body_gyroscope_jerk_mag_stdev  
freq_body_accelerometer_mean_x  
freq_body_accelerometer_mean_y  
freq_body_accelerometer_mean_z  
freq_body_accelerometer_stdev_x  
freq_body_accelerometer_stdev_y  
freq_body_accelerometer_stdev_z  
freq_body_accelerometer_jerk_mean_x  
freq_body_accelerometer_jerk_mean_y  
freq_body_accelerometer_jerk_mean_z  
freq_body_accelerometer_jerk_stdev_x  
freq_body_accelerometer_jerk_stdev_y  
freq_body_accelerometer_jerk_stdev_z  
freq_body_gyroscope_mean_x  
freq_body_gyroscope_mean_y  
freq_body_gyroscope_mean_z  
freq_body_gyroscope_stdev_x  
freq_body_gyroscope_stdev_y  
freq_body_gyroscope_stdev_z  
freq_body_accelerometer_mag_mean  
freq_body_accelerometer_mag_stdev  
freq_body_accelerometer_jerk_mag_mean  
freq_body_accelerometer_jerk_mag_stdev  
freq_body_gyroscope_mag_mean  
freq_body_gyroscope_mag_stdev  
freq_body_gyroscope_jerk_mag_mean  
freq_body_gyroscope_jerk_mag_stdev  

These features can be found in **'samsung_sensors_df'** R data.frame.

**'samsung_sensor_means_df'** R data.frame contains the average of each variable for each activity and each subject.