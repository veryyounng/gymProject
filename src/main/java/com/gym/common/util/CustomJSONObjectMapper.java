package com.gym.common.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ser.DefaultSerializerProvider;

public class CustomJSONObjectMapper extends ObjectMapper{

	private static final long serialVersionUID = 1L;

	// Json Null값 공백으로 변환
	public CustomJSONObjectMapper() {
		DefaultSerializerProvider.Impl sp = new DefaultSerializerProvider.Impl();
		sp.setNullValueSerializer(new NullSerializer());
		this.setSerializerProvider(sp);
	}
}
