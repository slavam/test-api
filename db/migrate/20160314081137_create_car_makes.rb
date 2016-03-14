class CreateCarMakes < ActiveRecord::Migration[5.0]
  def change
    create_table :car_makes do |t|
      t.string :mark
    end
    add_makes
  end
  
  def add_makes
    execute("INSERT INTO car_makes (id, mark) VALUES (1,'Acura'),(2,'Alfa Romeo'),(3,'Alpina'),(4,'Aro'),(5,'Asia'),(6,'Aston Martin'),(7,'Audi'),(8,'Austin'),(9,'Bentley'),(10,'BMW'),(11,'Brilliance'),(12,'Bugatti'),(13,'Buick'),(14,'BYD'),(15,'Cadillac'),(16,'Caterham'),(17,'ChangFeng'),(18,'Chery'),(19,'Chevrolet'),(20,'Chrysler'),(21,'Citroen'),(22,'Coggiola'),(23,'Dacia'),(24,'Dadi'),(25,'Daewoo'),(26,'Daihatsu'),(27,'Daimler'),(28,'Derways'),(29,'Dodge'),(30,'Dong Feng'),(31,'Doninvest'),(32,'Donkervoort'),(33,'Eagle'),(34,'FAW'),(35,'Ferrari'),(36,'Fiat'),(37,'Ford'),(38,'Geely'),(39,'Geo'),(40,'GMC'),(41,'Great Wall'),(42,'Hafei'),(43,'Honda'),(44,'HuangHai'),(45,'Hummer'),(46,'Hyundai'),(47,'Infiniti'),(48,'Iran Khodro'),(49,'Isuzu'),(50,'JAC'),(51,'Jaguar'),(52,'Jeep'),(53,'Kia'),(54,'Koenigsegg'),(55,'Lamborghini'),(56,'Lancia'),(57,'Land Rover'),(58,'Landwind'),(59,'Lexus'),(60,'Lifan'),(61,'Lincoln'),(62,'Lotus'),(63,'Mahindra'),(64,'Maruti'),(65,'Maserati'),(66,'Maybach'),(67,'Mazda'),(68,'Mercedes-Benz'),(69,'Mercury'),(70,'Metrocab'),(71,'MG'),(72,'Microcar'),(73,'Mini'),(74,'Mitsubishi'),(75,'Mitsuoka'),(76,'Morgan'),(77,'Nissan'),(78,'Oldsmobile'),(79,'Opel'),(80,'Pagani'),(81,'Peugeot'),(82,'Plymouth'),(83,'Pontiac'),(84,'Porsche'),(85,'Proton'),(86,'PUCH'),(87,'Renault'),(88,'Rolls-Royce'),(89,'Rover'),(90,'Saab'),(91,'Saleen'),(92,'Saturn'),(93,'Scion'),(94,'SEAT'),(95,'ShuangHuan'),(96,'Skoda'),(97,'Smart'),(98,'Spyker'),(99,'SsangYong'),(100,'Subaru'),(101,'Suzuki'),(102,'Tatra'),(103,'Tianma'),(104,'Tianye'),(105,'Toyota'),(106,'Trabant'),(107,'TVR'),(108,'Vector'),(109,'Volkswagen'),(110,'Volvo'),(111,'Wartburg'),(112,'Wiesmann'),(113,'Xin Kai'),(114,'ZX'),(115,'ВАЗ'),(116,'Велта'),(117,'ГАЗ'),(118,'ЗАЗ'),(119,'ЗИЛ'),(120,'ИЖ'),(121,'КАМАЗ'),(122,'ЛУАЗ'),(123,'Москвич'),(124,'СеАЗ'),(125,'СМЗ'),(126,'ТагАЗ'),(127,'УАЗ');")
  end
end
