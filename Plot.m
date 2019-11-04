function [videoFrame,points,bboxPoints] = Plot(img,img1,img2,img3,err_f,finalerror)
% For plot
% Eran Bamani
% 3.2.19
% exe 5 
% =========================================================================
% Create a cascade detector object.

faceDetector = vision.CascadeObjectDetector();

% % Read a video frame and run the face detector.
videoFileReader = vision.VideoFileReader(img);
videoFrame      = step(videoFileReader);
bbox            = step(faceDetector, videoFrame);
% 
% % Draw the returned bounding box around the detected face.
videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
% Convert the first box into a list of 4 points
% This is needed to be able to visualize the rotation of the object.
bboxPoints = bbox2points(bbox(1, :));
points = detectMinEigenFeatures(rgb2gray(videoFrame), 'ROI', bbox);
%--------------------------------------------------------------------------
videoFileReader1 = vision.VideoFileReader(img1);
videoFrame1      = step(videoFileReader1);
bbox1            = step(faceDetector, videoFrame1);
% 
% % Draw the returned bounding box around the detected face.
videoFrame1 = insertShape(videoFrame1, 'Rectangle', bbox1);

% 

%--------------------------------------------------------------------------
% plot
nFont=12;
nLine=2;
% 
figure(1)
imshow(videoFrame); title('Detected face');
% 
figure(2)
imshow(videoFrame), hold on, title('Detected features');
plot(points);
% 
figure(3)
imshow(videoFrame1); title('No face');
% 
figure(4)
img2 = imread('image_0005.jpg');
img2 = rgb2gray(img2);
imshow(img2); title('face?');
text(0.1,0.8,['Error=',err_f,'%'],'Units','normalized','Fontsize',nFont)
set(gca,'Fontsize',nFont)
grid on
finalerror = finalerror/100;
if finalerror<30
    text(0.1,0.6,'This is Face','Units','normalized','Fontsize',nFont)
else
    text(0.1,0.6,'No Face Detected','Units','normalized','Fontsize',nFont)
end

%

figure(5)
imshow(img3); title('face?');
finalerror = 100-finalerror;
err_f = num2str(finalerror);
text(0.1,0.8,['Error=',err_f,'%'],'Units','normalized','Fontsize',nFont)
set(gca,'Fontsize',nFont)
grid on
if finalerror<30
    text(0.1,0.6,'This is Face','Units','normalized','Fontsize',nFont)
else
    text(0.1,0.6,'No Face Detected','Units','normalized','Fontsize',nFont)
end
end

