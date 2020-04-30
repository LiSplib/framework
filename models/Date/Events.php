<?php

namespace App\Model\Date;
use App\Model\dataBase\PdoSql;

class Events {

    private $pdo;

    public function __construct() {

        $this->pdo = (new PdoSql)->getPdo();
        
    }

    public function getEventsBetween ( \DateTime $start, \DateTime $end): array {
        $sql = "SELECT * FROM events WHERE start BETWEEN '{$start->format('Y-m-d 00:00:00')}' AND '{$end->format('Y-m-d 23:59:59')}' ORDER BY start";
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
        $statement = $this->pdo->query("SELECT e.id , e.title, e.content, e.start, e.end, e.id_admin, image, lastname FROM events AS e JOIN admin ON e.id_admin = admin.id WHERE e.id = $id LIMIT 1");
        $statement->setFetchMode(\PDO::FETCH_CLASS, Event::class);
        $result = $statement->fetch();
        if ($result === false) {
            throw new \Exception('Aucun résultat n\'a été trouvé');
        }
        return $result;
    }

    public function hydrate (Event $event, array $data) {
        $event->setTitle($data['title']);
        $event->setContent($data['content']);
        $event->setStart(\DateTime::createFromFormat('Y-m-d H:i', $data['date'] . ' ' . $data['start'])->format('Y-m-d H:i:s'));
        $event->setEnd(\DateTime::createFromFormat('Y-m-d H:i', $data['date'] . ' ' . $data['end'])->format('Y-m-d H:i:s'));
        $event->setId_admin($_SESSION['auth']['id']);
        return $event;
    }

    public function create (Event $event): bool {
        $statement = $this->pdo->prepare("INSERT INTO events (title, content, start, end, id_admin) VALUES (?, ?, ?, ?, ?)");
        return $statement->execute([
            $event->getTitle(),
            $event->getContent(),
            $event->getStart()->format('Y-m-d H:i:s'),
            $event->getEnd()->format('Y-m-d H:i:s'),
            $event->getId_admin()
            ]);
    }

    public function update (Event $event): bool {
        $statement = $this->pdo->prepare('UPDATE events SET title = ?, content = ?, start = ?, end = ? WHERE id = ?');
        return $statement->execute([
            $event->getTitle(),
            $event->getContent(),
            $event->getStart()->format('Y-m-d H:i:s'),
            $event->getEnd()->format('Y-m-d H:i:s'),
            $event->getId()
        ]);
    }

    public function delete(int $id) {
        $statement = $this->pdo->prepare('DELETE FROM events WHERE events.id = :id');
        $statement->bindParam(':id', $id );
        return $statement->execute();
    }

    public function registerEvent(int $userId, int $eventId) {
        $sql = ('INSERT INTO register (admin_id, events_id) VALUES (:userId, :eventId)');
        $query = $this->pdo->prepare($sql);
        $query->bindValue(':userId', $userId, \PDO::PARAM_INT);
        $query->bindValue(':eventId', $eventId, \PDO::PARAM_INT);
        $query->execute();
        return $query;
    }

    public function registerCount(int $id){
        $sql = 'SELECT COUNT(*) FROM register WHERE events_id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindValue(':id', $id, \PDO::PARAM_INT);
        $query->execute();
        $resultat = $query->fetch();
        return $resultat;
    }

    public function eventsRegister($id){
        $sql = "SELECT * FROM register LEFT JOIN admin ON register.admin_id = admin.id LEFT JOIN events ON register.events_id = events.id WHERE events.id = $id";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetchAll();
        return $result;
    }
}