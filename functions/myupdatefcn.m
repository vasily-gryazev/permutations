function output_txt = myupdatefcn(~,event_obj)
    pos = get(event_obj, 'Position');
    output_txt = {['x:'num2str(pos(1))],['y:'num2str(pos(2))],['Val:'num2str(pos(3))]};
end 