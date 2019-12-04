%  davis=load('test_2.txt');
 davis(:,4)=(davis(:,4)-0.5)*2;
%  davis(:,1)=davis(:,1)-davis(1,1);
 error_index=zeros(size(davis,1),2);
error_pix=[38,168;52,127;130,5;144,69;6,227;114,27;19,27];%width,height
k=1;
for i=1:20000:size(davis,1)
   
   EventImage=zeros(260,346); 
    
   for j=i:i+19999
       flag=0;
       for ig=1:size(error_pix,1)
           if(davis(j,2:3)==error_pix(ig,:))
               flag=1;
           end
       end
       if(flag==0)
          EventImage(davis(j,3)+1,davis(j,2)+1)=EventImage(davis(j,3)+1,davis(j,2)+1)+davis(j,4);
       end
   end   
    
    Max=max(max(EventImage));
    Min=min(min(EventImage));
    
    if(abs(Min)/abs(Max)>10)   %“Ï≥£¥Û
%         davis_error=davis(i:j,:);
        [m,n]=find(EventImage==Min);
%         if(m==228)
%            ff=0; 
%         end
%         error_index0=find(davis_error(:,3)==m-1);
%         error_event0=davis_error(error_index0,:);
         for ee=1:size(n,1)
             error_index(k,:)=[n(ee,1)-1,m(ee,1)-1]; 
             k=k+1;
         end
         
        
%         error_index=find(error_event0(:,2)==n-1);
%         error_event=error_event0(error_index,:);
        
    end
%     imshow(EventImage);
    
end



