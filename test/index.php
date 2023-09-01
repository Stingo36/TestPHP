<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movies List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h1>Movies List</h1>

    <form action="" method="get" id="languageFilterForm" class="mb-3">
        <div class="form-group">
            <label for="languageFilter">Filter by Language:</label>
            <select name="languageFilter" id="languageFilter" class="form-control">
                <option value="">Select One</option>
                <option value="All Languages">All Languages</option>
                <?php
                include_once 'db_con.php';
                $languageOptionsQuery = "SELECT DISTINCT value FROM categories WHERE type = 'Language'";
                $languageOptionsResult = $conn->query($languageOptionsQuery);
                if ($languageOptionsResult->num_rows > 0) {
                    while ($languageOptionRow = $languageOptionsResult->fetch_assoc()) {
                        $languageOption = $languageOptionRow['value'];
                        echo "<option value=\"$languageOption\">$languageOption</option>";
                    }
                }
                ?>
            </select>
        </div>
    </form>

    <form action="" method="get" id="genreFilterForm" class="mb-3">
        <div class="form-group">
            <label for="genreFilter">Filter by Genre:</label>
            <select name="genreFilter" id="genreFilter" class="form-control">
                <option value="">Select One</option>
                <option value="All Genres">All Genres</option>
                <?php
                include_once 'db_con.php';
                $genreOptionsQuery = "SELECT DISTINCT value FROM categories WHERE type = 'Genre'";
                $genreOptionsResult = $conn->query($genreOptionsQuery);
                if ($genreOptionsResult->num_rows > 0) {
                    while ($genreOptionRow = $genreOptionsResult->fetch_assoc()) {
                        $genreOption = $genreOptionRow['value'];
                        echo "<option value=\"$genreOption\">$genreOption</option>";
                    }
                }
                ?>
            </select>
        </div>
    </form>

    <form action="" method="get" id="sortingForm" class="mb-3">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="sortCriteria">Sort by:</label>
                <select name="sortCriteria" id="sortCriteria" class="form-control">
                    <option value="">Select One</option>
                    <option value="title">Title</option>
                    <option value="release_date">Release Date</option>
                    <option value="movie_length_minutes">Movie Length</option>
                </select>
            </div>
        </div>
    </form>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Movie Length</th>
                <th>Release Date</th>
                <th>Language</th>
                <th>Genre</th>
            </tr>
        </thead>
        <tbody>
            <?php
            include_once 'db_con.php';
            $sql = "SELECT movies.title, movies.description, movies.movie_length_minutes, movies.release_date, 
                           GROUP_CONCAT(CASE WHEN categories.type = 'Language' THEN categories.value END) AS languages,
                           GROUP_CONCAT(CASE WHEN categories.type = 'Genre' THEN categories.value END) AS genres
                    FROM movies
                    LEFT JOIN categories ON movies.id = categories.movie_id
                    GROUP BY movies.id";

            if (isset($_GET['languageFilter']) && $_GET['languageFilter'] !== 'Select One') {
                $languageFilter = $_GET['languageFilter'];
                if ($languageFilter !== 'All Languages') {
                    $sql .= " HAVING languages LIKE '%$languageFilter%'";
                }
            }

            if (isset($_GET['genreFilter']) && $_GET['genreFilter'] !== 'Select One') {
                $genreFilter = $_GET['genreFilter'];
                if ($genreFilter !== 'All Genres') {
                    $sql .= " HAVING genres LIKE '%$genreFilter%'";
                }
            }

            if (isset($_GET['sortCriteria'])) {
                $sortCriteria = $_GET['sortCriteria'];
                $sql .= " ORDER BY $sortCriteria ASC";
            }

            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["title"] . "</td>";
                    echo "<td>" . $row["description"] . "</td>";
                    echo "<td>" . $row["movie_length_minutes"] . " minutes</td>";
                    echo "<td>" . $row["release_date"] . "</td>";
                    echo "<td>" . $row["languages"] . "</td>";
                    echo "<td>" . $row["genres"] . "</td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='6'>No movies found</td></tr>";
            }
            $conn->close();
            ?>
        </tbody>
    </table>
</div>

<script>
    document.getElementById("languageFilter").addEventListener("change", function() {
        document.getElementById("languageFilterForm").submit();
    });

    document.getElementById("genreFilter").addEventListener("change", function() {
        document.getElementById("genreFilterForm").submit();
    });

    document.getElementById("sortCriteria").addEventListener("change", function() {
        document.getElementById("sortingForm").submit();
    });
</script>

</body>
</html>
