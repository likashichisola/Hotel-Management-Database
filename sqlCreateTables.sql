USE hotel_x;

CREATE TABLE manager (
  ManagerID VARCHAR(55) NOT NULL,
  FirstName VARCHAR(55) NOT NULL,
  LastName VARCHAR(55) NOT NULL,
  PhoneNumber VARCHAR(55) NOT NULL,
  PRIMARY KEY (ManagerID)
);

CREATE TABLE branch (
  BranchID VARCHAR(55) NOT NULL,
  Branch VARCHAR(55) NOT NULL,
  ManagerID VARCHAR(55) NOT NULL,
  BranchAddress VARCHAR(55) NOT NULL,
  PRIMARY KEY (BranchID),
  FOREIGN KEY (ManagerID) REFERENCES Manager (ManagerID)
);

CREATE TABLE registration (
  RegistrationID VARCHAR(55) NOT NULL,
  Email VARCHAR(255) UNIQUE NOT NULL,
  MailingAddress VARCHAR(255) NOT NULL,
  StreetZIP VARCHAR(55) NOT NULL,
  City VARCHAR(55) NOT NULL,
  State VARCHAR(55) NOT NULL,
  Country VARCHAR(55) NOT NULL,
  PRIMARY KEY (RegistrationID)
);

CREATE TABLE customer (
  CustomerID VARCHAR(55) NOT NULL,
  RegistrationID VARCHAR(55) NOT NULL,
  FirstName VARCHAR(55) NOT NULL,
  LastName VARCHAR(55) NOT NULL,
  PhoneNumber VARCHAR(55) NOT NULL,
  MailingAddress VARCHAR(255) NOT NULL,
  Gender VARCHAR(55) NOT NULL,
  PRIMARY KEY (CustomerID),
  FOREIGN KEY (RegistrationID) REFERENCES registration (RegistrationID)
);

CREATE TABLE preferences (
  PreferenceNo VARCHAR(55) NOT NULL,
  Preference VARCHAR(55) NOT NULL,
  PRIMARY KEY (PreferenceNo)
);

CREATE TABLE reservation (
  ReservationID VARCHAR(55) NOT NULL,
  RegistrationID VARCHAR(55) NOT NULL,
  BranchID VARCHAR(55) NOT NULL,
  Check_in VARCHAR(55) NOT NULL,
  Check_out VARCHAR(55) NOT NULL,
  PreferenceNo VARCHAR(55) NOT NULL,
  BookingDate VARCHAR(55) NOT NULL,
  TotalPrice int Not Null,
  PRIMARY KEY (ReservationID),
  FOREIGN KEY (RegistrationID) REFERENCES registration (RegistrationID),
  FOREIGN KEY (BranchID) REFERENCES branch (BranchID),
  FOREIGN KEY (PreferenceNo) REFERENCES preferences (PreferenceNo)
);

CREATE TABLE ratinglist (
  RatingScale INT NOT NULL,
  Rating VARCHAR(55) NOT NULL,
  PRIMARY KEY (RatingScale)
);

CREATE TABLE reservationrating (
  ReservationID VARCHAR(55) NOT NULL,
  RegistrationID VARCHAR(255) NOT NULL,
  RatingScale INT NOT NULL,
  PRIMARY KEY (ReservationID),
  FOREIGN KEY (RegistrationID) REFERENCES registration (RegistrationID),
  FOREIGN KEY (RatingScale) REFERENCES ratinglist (RatingScale)
);

CREATE TABLE roomcapacity (
  RoomType VARCHAR(55) NOT NULL,
  Capacity INT NOT NULL,
  PRIMARY KEY (RoomType)
);

CREATE TABLE room (
  RoomID VARCHAR(55) NOT NULL,
  RoomType VARCHAR(55) NOT NULL,
  Capacity INT NOT NULL,
  Location VARCHAR(55) NOT NULL,
  BranchID VARCHAR(55) NOT NULL,
  PRIMARY KEY (RoomID),
  FOREIGN KEY (BranchID) REFERENCES branch (BranchID),
  FOREIGN KEY (RoomType) REFERENCES roomcapacity (RoomType)
);

CREATE TABLE roomdetails (
  RoomID VARCHAR(55) NOT NULL,
  RoomType VARCHAR(55) NOT NULL,
  Branch VARCHAR(55) NOT NULL,
  PRIMARY KEY (RoomID),
  FOREIGN KEY (RoomType) REFERENCES roomcapacity (RoomType)
);

CREATE TABLE price (
  Price DECIMAL(10,2) NOT NULL,
  DurationInDays INT NOT NULL,
  RoomType VARCHAR(55) NOT NULL,
  PRIMARY KEY (Price),
  FOREIGN KEY (RoomType) REFERENCES roomcapacity (RoomType)
);

CREATE TABLE invoice (
  InvoiceNo VARCHAR(55) NOT NULL,
  ReservationID VARCHAR(55) unique NOT NULL,
  Price DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (InvoiceNo),
  FOREIGN KEY (ReservationID) REFERENCES reservation (ReservationID),
  FOREIGN KEY (Price) REFERENCES price (Price)
);

CREATE TABLE Reservationroom (
  RoomID VARCHAR(55) NOT NULL,
  ReservationID VARCHAR(55) NOT NULL,
  PRIMARY KEY (RoomID),
  FOREIGN KEY (ReservationID) REFERENCES reservation (ReservationID)
);
