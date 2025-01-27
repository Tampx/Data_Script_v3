start_setActivity = os.exit
start_setMain = os.exit
function ARMx32(...)
	local addr_list = gg.getRangesList('libc.so')
	local addr
	for _, v in ipairs(addr_list) do
		if v.type:sub(2, 2) == 'w' then
			addr = {address = v.start, flags = 4}
			break
		end
	end
	if not addr then gg.alert("Failed", "") return end
	local old = gg.getValues({addr})
	local result = ""
	
	for _, arm in ipairs({...}) do
		addr.value = '~A ' .. arm
		pcall(gg.setValues, {addr})
		local temp_result = gg.getValues({addr})[1].value & 0xFFFFFFFF
		temp_result = string.unpack('>I4', string.pack('<I4', temp_result))
		temp_result = string.format('%08X', temp_result)
		result = result .. temp_result
	end
	gg.setValues(old)
	return "h" .. result
end
if not gg.TamPxLoad('https://www.google.com').encode then
	gg.alert('Bạn Đang Ngoại Tuyến Hãy Thử Kiểm Tra Lại Kết Nối Internet \nYou Are Offline Please Check Your Internet Connection')
	os.exit()
end
function TamPx_Script_ExpirationDate_Online(expiryDate)
	bool_setActivity = true
	int_setMain = true
	if not gg.TamPxLoad then
		return {false , 'GameGuardian'}
	end
	Date_Linkk = gg.TamPxLoad('https://www.google.com')
	if not Date_Linkk.encode then
		return {false , 'Internet'}
	end
	Online_Date = Date_Linkk.headers["Date" ][1] 
	month={"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
	for i=1,12 do
		if month[i]==string.sub(Online_Date,9, 11) then
			if i<10 then
				i="0"..i 
			end 
		currentdate=string.sub(Online_Date,13, 16)..i..string.sub(Online_Date,6, 7)  
		end
	end
	if tonumber(currentdate)>=tonumber(expiryDate) then
		gg.TamPxShell('su -c "rm \'' .. File_OBF .. '\'"')
		TamPx_Expiry = gg.colorAlert("<b><font color='#FF0000'>⚠ Cảnh Báo ⚠</font></b>","<b><i><font color='#00FFFF'>Phiên Bản Script Này Đã Hết Hạn Vui Lòng Cập Nhật Phiên Bản Mới Từ Kênh Youtube Tam Px<br>Đã xóa dữ liệu và Script này để tránh lỗi khi sử dụng phiên bản mới.</font></i></b><br><b><i><font color='#00BFFF'>This Script Version Has Expired Please Update New Version From TamPx Youtube Channel<br>Deleted this data and script to avoid errors when using the new version.</font></i></b><br><br><u><b><i><font color='#00FF00'>Phiên Bản Này Đã Dừng Lại Tại Đây.</font></i></b></u><br><u><b><i><font color='#00FF00'>This Version Ends Here Goodbye.</font></i></b></u>", "Go To Youtube Channel", "Exit")
		if TamPx_Expiry == 1 then
			gg.setVisible(false)
			gg.gotoBrowser('https://youtube.com/@tampxz?si=6rWU_-q9vlZBjCOS')
		end
		start_setMain()
	end
	return {true}
end
