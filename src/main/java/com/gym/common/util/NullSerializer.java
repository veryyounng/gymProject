package com.gym.common.util;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

public class NullSerializer extends JsonSerializer<Object> {

	// Json null 값 공백으로 치환용
	@Override
	public void serialize(Object value, JsonGenerator gen, SerializerProvider serializers)
			throws IOException, JsonProcessingException {
		// TODO Auto-generated method stub
		gen.writeString("");
	}

}
