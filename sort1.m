function [x,y,z]= sort1(a,b,c)
if and (evalf(a(1),a(2))> evalf(b(1),b(2)),evalf(a(1),a(2))> evalf(c(1),c(2)))
    if (evalf(b(1),b(2))> evalf(c(1),c(2)))
            x=a;
            y=b;
            z=c;
     return
    end
            x=a
            y=c
            z=b
      return
end
if and (evalf(b(1),b(2))> evalf(a(1),a(2)),evalf(b(1),b(2))> evalf(c(1),c(2)))
    if (evalf(c(1),c(2))> evalf(a(1),a(2)))
            x=b
            y=c
            z=a
     return
    end
            x=b
            y=a
            z=c
      return     
end

    if (evalf(b(1),b(2))> evalf(a(1),a(2)))
            x=c
            y=b
            z=a
     return
    end
            x=c
            y=a
            z=b
      return  
end