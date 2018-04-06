 <?php
function initDatabase() {
	try {
	  require __DIR__.'/config.php';

	  $pdo = new PDO(
	    "mysql:dbname=$dbname;host=$host;charset=utf8", $user, $password
	  );
	} catch (PDOException $e) {
	  echo 'erreur : ' . $e->getMessage();

	  $pdo = null;
	}
//les noms n'ont de valeur que dans la fonction où ils sont déclarés
	return $pdo;
}


function prepareStatement($sql) {
	$pdo_statement = null;

	$pdo = initDatabase();

	if ($pdo) {
		try {
		  $pdo_statement = $pdo->prepare($sql);
		} catch (PDOException $e) {
		  echo 'erreur : ' . $e->getMessage();
		}
	}
//les noms n'ont de valeur que dans la fonction où ils sont déclarés
	return $pdo_statement;
}


function getAll() {
	$todos = [];

	$pdo_statement = prepareStatement('SELECT * FROM todos WHERE deleted_at IS NULL');

	if ($pdo_statement && $pdo_statement->execute()) {
		$todos = $pdo_statement->fetchAll(PDO::FETCH_ASSOC);
	}

	return $todos;
}


function getOne($id) {
	$todo = null;
	$pdo_statement = prepareStatement('SELECT * FROM todos WHERE id=:id');

	if (
  	$pdo_statement &&
  	$pdo_statement->bindParam(':id', $id, PDO::PARAM_INT) &&
  	$pdo_statement->execute()
	) {
  	$todo = $pdo_statement->fetch(PDO::FETCH_ASSOC);
	}
  return $todo;
}


function addOne($title, $description) {
	$pdo_statement = prepareStatement('INSERT INTO todos (title, description)' .
  		'VALUES (:title, :description)');

	if (
	  $pdo_statement &&
	  $pdo_statement->bindParam(':title', $title) &&
	  $pdo_statement->bindParam(':description', $description) &&
	  $pdo_statement->execute()
	 ) {
	 	return $pdo_statement;
      }  
}


function deleteOne($id) {
	$pdo_statement = prepareStatement('UPDATE todos SET deleted_at = CURRENT_TIMESTAMP() WHERE id=:id');
	if (
    !$pdo_statement ||
    !$pdo_statement->bindParam(':id', $id, PDO::PARAM_INT) ||
    !$pdo_statement->execute()
  ) {
    return $pdo_statement;
  }

}

      
function editOne($id, $title, $description) {
	$todo = null;
	$pdo_statement = prepareStatement('UPDATE todos SET title=:title, description=:description WHERE id=:id');
	if (
	  $pdo_statement &&
	  $pdo_statement->bindParam(':id', $id, PDO::PARAM_INT) &&
	  $pdo_statement->bindParam(':title', $title) &&
	  $pdo_statement->bindParam(':description', $description) &&
	  $pdo_statement->execute()
	) {
	  $todo = $pdo_statement->fetch(PDO::FETCH_ASSOC);
	  return $todo;
	}
}