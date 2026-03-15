# Use the official Nginx image as the base image ,this image is very light weight
FROM nginx:alpine

#here i sma setting the workking directory to the default nginx html directory where we will copy our build files
WORKDIR /usr/share/nginx/html

#Remove the default nginx html files, we dont need them as we will be copying our own build files here
RUN rm -rf ./*

#Copy the index.html file from the current directory to the nginx html directory in the container
COPY index.html .

##Expose port 80 to allow incoming traffic to the nginx server
EXPOSE 80

#Start the nginx server when the container starts, the -g flag is used to specify global directives for nginx, in this case we are telling nginx to run in the foreground (daemon off) so that the container does not exit immediately after starting nginx
CMD ["nginx" , "-g" , "daemon off;"]

