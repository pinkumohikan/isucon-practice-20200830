ALTER TABLE image ADD INDEX index_name(name);
ALTER TABLE message ADD INDEX index_channel_id(channel_id);
ALTER TABLE user ADD INDEX index_name(name);
