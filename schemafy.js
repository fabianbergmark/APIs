/**
 * JSON schema generator.
 */

function union(schemas) {
  if (schemas.length == 0) {
    return null;
  }
  var type = schemas[0].type;
  var keys = {};
  var items = [];
  for (var i = 0; i < schemas.length; ++i) {
    var schema = schemas[i];
    if (schema.type != type) {
      return null;
    }
    if (schema.type === 'array') {
      items.push(schema.items);
    } else if (schema.type === 'object') {
      for (var key in schema.properties) {
        if (keys[key] == null)
          keys[key] = { schemas: [],
                        count: 0 };
        keys[key].schemas.push(schema.properties[key]);
        ++keys[key].count;
      }
    }
  }
  if (type === 'array') {
    var schema = { type: 'array' };
    var itemsSchema = union(items);
    schema.items = itemsSchema;
    return schema;
  } else if (type === 'object') {
    var schema = { type: 'object',
                   properties: {},
                   required: [] };
    for (var key in keys) {
      var keySchema = union(keys[key].schemas);
      schema.properties[key] = keySchema;
      if (keys[key].count == schemas.length)
        schema.required.push(key);
    }
    return schema;
  } else {
    return schemas[0];
  }
}

function schemafy(json) {
  var schema = {};
  if (json === null) {
    schema.type = "null";
  } else if (Array.isArray(json)) {
    schema.type = "array";
    var items = []
    for (var i = 0; i < json.length; ++i)
      items.push(schemafy(json[i]));
    schema.items = union(items);
  } else {
    var type = typeof json;
    switch (type) {
    case 'boolean':
      schema.type = 'boolean';
      break;
    case 'number':
      schema.type = 'number';
      break;
    case 'object':
      schema.type = 'object';
      schema.properties = {};
      schema.required = [];
      for (var key in json) {
        var val = json[key];
        schema.properties[key] = schemafy(val);
        schema.required.push(key);
      }
      break;
    case 'string':
      schema.type = 'string';
      break;
    }
  }
  return schema;
}
