class DateTime
	def to_time
	 obj = new_offset(0)
	 return Time.utc(obj.year, obj.month, obj.day, obj.hour, obj.min, obj.sec, 0)
	end
end
