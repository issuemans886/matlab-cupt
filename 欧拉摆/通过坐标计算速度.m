V=zeros(1,750)
for i=1:1:750
    r=sqrt((Y(i+1)-Y(i))^2+(X(i+1)-X(i))^2)
    V(i)=r/(t(i+1)-t(i))
end
scatter(t',V)