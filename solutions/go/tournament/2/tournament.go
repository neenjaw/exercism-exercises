package tournament

import (
	"encoding/csv"
	"errors"
	"fmt"
	"io"
	"sort"
)

// Sprintf format for printing the results once totaled
const tableFormat = "%-30v | %2v | %2v | %2v | %2v | %2v\n"

// The header for the table
var tableHeader = fmt.Sprintf(tableFormat, "Team", "MP", "W", "D", "L", "P")

type TeamName string
type GameResult int

const (
	Win GameResult = iota
	Loss
	Draw
)

// create a GameResult from a string
func makeResult(result string) (GameResult, error) {
	switch result {
	case "win":
		return Win, nil
	case "loss":
		return Loss, nil
	case "draw":
		return Draw, nil
	default:
		return 0, errors.New("result format error")
	}
}

func (r GameResult) invert() GameResult {
	switch r {
	case Win:
		return Loss
	case Loss:
		return Win
	default:
		return Draw
	}
}

type TeamRecord struct {
	name   TeamName
	played int
	won    int
	lost   int
	drawn  int
	points int
}

func (team *TeamRecord) annotateResult(result GameResult) {
	team.played += 1

	switch result {
	case Win:
		team.won += 1
		team.points += 3
	case Draw:
		team.drawn += 1
		team.points += 1
	case Loss:
		team.lost += 1
	}
}

func (t *TeamRecord) String() string {
	return fmt.Sprintf(tableFormat, t.name, t.played, t.won, t.drawn, t.lost, t.points)
}

// for sorting the slice of TeamRecord
type ByPointsAndName []TeamRecord

func (a ByPointsAndName) Len() int      { return len(a) }
func (a ByPointsAndName) Swap(i, j int) { a[i], a[j] = a[j], a[i] }
func (a ByPointsAndName) Less(i, j int) bool {
	// order by points
	if a[i].points > a[j].points {
		return true
	}
	if a[i].points < a[j].points {
		return false
	}
	// if points are equal, then order by name
	return a[i].name < a[j].name
}

func Tally(reader io.Reader, writer io.Writer) error {
	teamMap := make(map[TeamName]*TeamRecord)

	csvReader := csv.NewReader(reader)
	csvReader.Comma = ';'
	csvReader.Comment = '#'
	csvReader.TrimLeadingSpace = true
	records, err := csvReader.ReadAll()

	if err != nil {
		return errors.New("improper format")
	}

	for _, record := range records {
		homeTeam, awayTeam, result, err := handleRecord(record)

		if err != nil {
			return err
		}

		// annotate the home team
		team := getTeamRecord(teamMap, homeTeam)
		team.annotateResult(result)

		// annotate the away team
		team = getTeamRecord(teamMap, awayTeam)
		team.annotateResult(result.invert())
	}

	teams := make([]TeamRecord, 0, len(teamMap))
	for _, team := range teamMap {
		teams = append(teams, *team)
	}
	sort.Sort(ByPointsAndName(teams))

	fmt.Fprintf(writer, tableHeader)
	for _, team := range teams {
		fmt.Fprintf(writer, team.String())
	}

	return nil
}

func handleRecord(record []string) (TeamName, TeamName, GameResult, error) {
	if len(record) != 3 {
		return "", "", 0, errors.New("improper format")
	}

	homeTeam := TeamName(record[0])
	awayTeam := TeamName(record[1])

	if homeTeam == awayTeam {
		return "", "", 0, errors.New("team names can't match")
	}

	result, err := makeResult(record[2])
	if err != nil {
		return "", "", 0, err
	}

	return homeTeam, awayTeam, result, nil
}

func getTeamRecord(teamRecordMap map[TeamName]*TeamRecord, name TeamName) *TeamRecord {
	team, ok := teamRecordMap[name]
	if !ok {
		team = &TeamRecord{name: name}
		teamRecordMap[name] = team
	}
	return team
}
