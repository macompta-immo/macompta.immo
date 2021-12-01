CREATE TABLE IF NOT EXISTS user(
	user_id INT NOT NULL AUTO_INCREMENT,  
  first_name VARCHAR(128),
  last_name VARCHAR(128),
  email VARCHAR(255),
  last_Seen timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,

  PRIMARY KEY(user_id)
);

CREATE TABLE IF NOT EXISTS entity(
	entity_id INT NOT NULL AUTO_INCREMENT,  
  name VARCHAR(128),
  siret VARCHAR(128),
  gerant int,
  alt_gerant varchar(128),

  PRIMARY KEY(entity_id),
  FOREIGN KEY (gerant) REFERENCES user(user_id)
);

CREATE TABLE IF NOT EXISTS user_own_entity (
  owner_id int NOT NULL,
  entity_id int NOT NULL,
  
  PRIMARY KEY (owner_id, entity_id),
  FOREIGN KEY (owner_id) REFERENCES user(user_id) ON DELETE CASCADE,
  FOREIGN KEY (entity_id) REFERENCES entity(entity_id) ON DELETE CASCADE
  )

CREATE TABLE IF NOT EXISTS entity_own_entity (
  owner_id int NOT NULL,
  entity_id int NOT NULL,
  
  PRIMARY KEY (owner_id, entity_id),
  FOREIGN KEY (owner_id) REFERENCES entity(entity_id) ON DELETE CASCADE,
  FOREIGN KEY (entity_id) REFERENCES entity(entity_id) ON DELETE CASCADE
  )

CREATE TABLE IF NOT EXISTS property(
	property_id INT NOT NULL AUTO_INCREMENT,
  street_number int not null,
  street_kind varchar(64),
  street_name VARCHAR(256),
  appartment_number varchar(16),
  siret VARCHAR(128),
  parent INT,
  
  PRIMARY KEY(property_id),
  FOREIGN KEY (parent) REFERENCES entity(entity_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS entity_own_property (
  entity_id int NOT NULL,
  property_id int NOT NULL,
  
  PRIMARY KEY (entity_id, property_id),
  FOREIGN KEY (entity_id) REFERENCES entity(entity_id) ON DELETE CASCADE,
  FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE
  )

INSERT INTO users VALUES(1000,'Azoulay','Kevin','azoulay.kevin@gmail.com');