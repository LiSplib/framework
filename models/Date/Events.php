<?php

namespace App\Model\Date;
use App\Model\dataBase\PdoSql;

class Events {

    private $pdo;

    public function __construct() {

        $this->pdo = (new PdoSql)->getPdo();
        
    }

    public function getEventsBetween ( \DateTime $start, \DateTime $end): array {
        $sql = "SELECT * FROM events WHERE start BETWEEN '{$start->format('Y-m-d 00:00:00')}' AND '{$end->format('Y-m-d 23:59:59')}' AND isValide = 0 ORDER BY start";
        $statement = $this->pdo->prepare($sql);
        $statement->execute();
        $results = $statement->fetchAll();
        return $results;
    }

    public function getEventsBetweenByDay ( \DateTime $start, \DateTime $end) : array {
        $events = $this->getEventsBetween($start, $end);
        $days = [];
        foreach($events as $event) {
            $date = explode(' ', $event['start'])[0];
            if (!isset($days[$date])){
                $days[$date] = [$event];
            }else {
                $days[$date][] = $event;
            }
        }
        return $days; 
    }

    public function find (int $id): Event {
        require 'Event.php';
        $statement = $this->pdo->query("SELECT e.id , e.title, e.content, e.start, e.end, e.id_admin, e.theme, e.themeColor, e.urlImage, e.isValide, e.adress, e.zipcode, e.city, image, lastname, firstname FROM events AS e JOIN admin ON e.id_admin = admin.id WHERE e.id = $id LIMIT 1");
        $statement->setFetchMode(\PDO::FETCH_CLASS, Event::class);
        $result = $statement->fetch();
        if ($result === false) {
            throw new \Exception('Aucun résultat n\'a été trouvé');
        }
        return $result;
    }

    public function enumTheme(): array{
        $sql = "SHOW COLUMNS FROM events LIKE 'theme'";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        $results = $result['Type'];
        $allTheme = substr($results, 5, -1);
        $allTheme = explode(",", $allTheme);
        return $allTheme;
    }

    public function hydrate (Event $event, array $data): Event {
        $event->setTitle($data['title']);
        $event->setContent($data['content']);
        $event->setStart(\DateTime::createFromFormat('Y-m-d H:i', $data['date'] . ' ' . $data['start'])->format('Y-m-d H:i:s'));
        $event->setEnd(\DateTime::createFromFormat('Y-m-d H:i', $data['date'] . ' ' . $data['end'])->format('Y-m-d H:i:s'));
        $event->setId_admin($_SESSION['auth']['id']);
        $event->setTheme($data['theme']);
        $event->setThemeColor($data['themeColor']);
        $event->setUrlImage($data['urlImage']);
        $event->setIsValide($data['isValide']);
        $event->setAdress($data['adress']);
        $event->setZipcode($data['zipcode']);
        $event->setCity($data['city']);
        return $event;
    }

    public function create (Event $event): bool {
        $statement = $this->pdo->prepare("INSERT INTO events (title, content, start, end, theme, themeColor, urlImage, isValide, id_admin, adress, zipcode, city) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        return $statement->execute([
            $event->getTitle(),
            $event->getContent(),
            $event->getStart()->format('Y-m-d H:i:s'),
            $event->getEnd()->format('Y-m-d H:i:s'),
            $event->getTheme(),
            $event->getThemeColor(),
            $event->getUrlImage(),
            $event->getIsValide(),
            $event->getId_admin(),
            $event->getAdress(),
            $event->getZipcode(),
            $event->getCity()
            ]);
    }

    public function update (Event $event): bool {
        $statement = $this->pdo->prepare('UPDATE events SET title = ?, content = ?, start = ?, end = ?, theme = ?, themeColor = ?, urlImage = ?, adress = ?, zipcode = ?, city = ? WHERE id = ?');
        return $statement->execute([
            $event->getTitle(),
            $event->getContent(),
            $event->getStart()->format('Y-m-d H:i:s'),
            $event->getEnd()->format('Y-m-d H:i:s'),
            $event->getTheme(),
            $event->getThemeColor(),
            $event->getUrlImage(),
            $event->getAdress(),
            $event->getZipcode(),
            $event->getCity(),
            $event->getId()
        ]);
    }

    public function delete(int $id): int {
        $statement = $this->pdo->prepare('DELETE FROM events WHERE events.id = :id');
        $statement->bindParam(':id', $id );
        return $statement->execute();
    }


//Lie l'utilisateur à l'évènement
    public function registerEvent(int $userId, int $eventId) {
        $sql = ('INSERT INTO register (admin_id, events_id) VALUES (:userId, :eventId)');
        $query = $this->pdo->prepare($sql);
        $query->bindValue(':userId', $userId, \PDO::PARAM_INT);
        $query->bindValue(':eventId', $eventId, \PDO::PARAM_INT);
        $query->execute();
        return $query;
    }


//Retourne le nombres d'inscrits à l'évènement
    public function registerCount(int $id): array{
        $sql = 'SELECT COUNT(*) FROM register WHERE events_id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindValue(':id', $id, \PDO::PARAM_INT);
        $query->execute();
        $resultat = $query->fetch();
        return $resultat;
    }


//Liste les personnes inscrites à l'évènement
    public function eventsRegister(int $id): array {
        $sql = "SELECT * FROM register LEFT JOIN admin ON register.admin_id = admin.id LEFT JOIN events ON register.events_id = events.id WHERE events.id = $id";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetchAll();
        return $result;
    }


//Lie l'utilisateur à l'évènement
    public function interestedEvent(int $userId, int $eventId) {
        $sql = ('INSERT INTO interested (admin_id, events_id) VALUES (:userId, :eventId)');
        $query = $this->pdo->prepare($sql);
        $query->bindValue(':userId', $userId, \PDO::PARAM_INT);
        $query->bindValue(':eventId', $eventId, \PDO::PARAM_INT);
        $query->execute();
        return $query;
    }


//Retourne le nombre d'intéressés à l'évènement
    public function interestedCount(int $id) :array {
        $sql = 'SELECT COUNT(*) FROM interested WHERE events_id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindValue(':id', $id, \PDO::PARAM_INT);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }

//Liste les personnes inscrites à l'évènement
    public function interestedRegister(int $id): array {
        $sql = "SELECT * FROM interested LEFT JOIN admin ON interested.admin_id = admin.id LEFT JOIN events ON interested.events_id = events.id WHERE events.id = $id";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetchAll();
        return $result;
    }


//Ajoute une couleur en fonction du thème de l'évènement
    public function addColorTheme($theme): string{
        switch ($theme){
            case 'Développement Personnel';
                $color = 'danger';
                return $color;
            break;
            case 'Dirigeant';
                $color = 'success';
                return $color;
            break;
            case 'Grande Entreprise';
                $color = 'primary';
                return $color;
            break;
            case 'PME';
                $color = 'warning';
                return $color;
            break;
        }
    }

//Count évènement à valider
    public function eventsAwaitCount(){
        $sql = 'SELECT COUNT(*) FROM events WHERE isValide = 1';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }

//Liste les évènements à valider
    public function eventsToValidate(){
        $sql = 'SELECT * FROM events WHERE isValide = 1 ORDER BY start';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $results = $query->fetchAll();
        return $results;
    }

//Validation d'évènement
    public function validateEvent($isValide, $id){
        $sql = 'UPDATE events SET isValide = :isValide WHERE id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':isValide', $isValide, \PDO::PARAM_INT);
        $query->bindParam(':id', $id);
        $query->execute();
        return $query;
    }
    
}