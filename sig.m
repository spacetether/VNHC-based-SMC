function [outputArg1] = sig(x,a)
%SIG 此处显示有关此函数的摘要
%   此处显示详细说明
outputArg1 = sign(x)*abs(x)^a;
% if abs(x)>1
%     outputArg1=-sign(x);
% end
end

