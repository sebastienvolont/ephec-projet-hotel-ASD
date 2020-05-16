INSERT INTO AGENTS VALUES 
('A1','Dupont','Marcel','Receptionniste'),
('A2','Blervaque','Aurélie','Receptionniste'),
('A3','Brutus','Jimmy','Animateur'),
('A4','Duchateau','Philippe','Animateur'),
('A5','Montignie','Bernard','Cuisinier'),
('A6','Loupinou','Gerard','Cuisinier'),
('A7','Merino','Paul','Serveur'),
('A8','Crymo','Roland','Serveur');

INSERT INTO ACTIVITEES (idActivitee,nomActivitee, nbrPersonne, prix, typeActivitee, jourSemaine, horaires,idAgent)
VALUES
    ('Acti01','Escalade', 4 , 5, 'Sport', 'Lundi', '08h00 à 9h40','A3'),
    ('Acti02','Visite de la ville', 8 , 20, 'Divertissement', 'Lundi', '10h00 à 14h00','A4'),
    ('Acti03','Spectacle', 12, 6, 'Divertissement', 'Lundi', '19h45 à 22h00','A4'),
    ('Acti04','Kayak', 8, 12, 'Sport', 'Mardi', '09h15 à 12h45','A4'),
    ('Acti05','Cours de yoga', 6 , 3, 'Divertissement', 'Mardi', '14h00 à 15h00','A3'),
    ('Acti06','Volley Ball', 10, 4, 'Sport', 'Mardi', '15h30 à 17h30','A3'),
    ('Acti07','Randonnée', 10, 16, 'Divertissement', 'Mercredi', '09h00 à 13h00','A4'),
    ('Acti08','Tournoi de Ping-pong', 12 , 5, 'Sport', 'Mercredi', '16h00 à 17h00','A3'),
    ('Acti09','Soirée karaoké', 12, 4, 'Divertissement', 'Mercredi', '20h00 à 22h30','A3'),
    ('Acti10','Initiation au surf', 6 , 9, 'Sport', 'Jeudi', '10h00 à 12h00','A4'),
    ('Acti11','Tennis', 4 , 5, 'Sport', 'Jeudi', '14h00 à 16h00','A3'),
    ('Acti12','Parties de poker', 4, 7, 'Divertissement', 'Jeudi', '20h00 à 22h00','A3'),
    ('Acti13','Matinée à la mer', 8, 10, 'Divertissement', 'Vendredi', '07h00 à 11h30','A4'),
    ('Acti14','Promenade en vélo', 8, 12, 'Sport', 'Vendredi', '14h00 à 18h00','A4'),
    ('Acti15','Soirée cinéma', 12 , 8, 'Divertissement', 'Vendredi', '20h00 à 22h00','A3'),
    ('Acti16','Pétanque', 6, 3, 'Sport', 'Samedi', '10h00 à 11h30','A4'),
    ('Acti17','Mini-golf', 4, 5, 'Divertissement', 'Samedi', '14h00 à 17h00','A3'),
    ('Acti18','Soirée dansante', 10 , 6, 'Divertissement', 'Samedi', '20h00 à 00h00','A4'),
    ('Acti19','Match de Waterpolo', 10 , 5, 'Sport', 'Dimanche', '10h00 à 12h00','A3'),
    ('Acti20','Atelier peinture', 5, 6, 'Divertissement', 'Dimanche', '15h00 à 17h00','A4');
    
    INSERT INTO CHAMBRES VALUES 
                    ('ch_01', 'Chambre Double', 100, 2,'Chambre standard moderne prévue de toutes les facilités d''un 4 étoiles. 
                    Comprend un lit double, une salle de douche et un balcon. 
                    Elles sont également plus spacieuse' ),

		                ('ch_02', 'Chambre Familial', 200, 5,'Chambre plus spacieuse contenant 2 lits double ainsi qu’un petit espace salon avec TV, possibilité de transformer le canapé en lit permettant d’accueillir une 5ème personne.
                    Cette chambre est idéale pour les familles avec enfants'),

	   	              ('ch_03', 'Suite de Luxe', 400, 3,'La suite de luxe est la plus grande chambre de l’hôtel. 
                    Située au dernier étage elle surplombe tout le complexe offrant une vue splendide depuis sa magnifique terrasse. 
                    Cette suite de luxe contient un salon, une salle de bain comprenant baignoire et douche, ainsi qu’un lit King size haut de gamme.
                    Idéale pour un séjour dans le confort et le luxe'),

		                ('ch_04', 'Chambre Economique', 25, 1,'Une chambre standard moderne, lit simple et salle de douche' ),

	                  ('ch_05', 'Chambre Simple', 50, 1,'Chambre standard moderne prévue de toutes les facilités d''un 4 étoiles.
                     Comprend un lit simple, une salle de douche et un petit balcon');
