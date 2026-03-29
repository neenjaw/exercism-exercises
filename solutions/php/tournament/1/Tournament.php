<?php

declare(strict_types=1);

class Tournament
{
    private const HEADER = 'Team                           | MP |  W |  D |  L |  P';

    public function tally(string $record): string
    {
        $lines = explode("\n", $record);
        $records = array_merge(...array_map(fn (string $line) => $this->parseLine($line), $lines));

        $index = [];
        foreach ($records as $record) {
            $index[$record->team] ??= new TeamRecord($record->team);
            $index[$record->team]->tallyGameRecord($record);
        }
        usort($index, fn ($a, $b) => self::sortTeamRecords($a, $b));

        $printable_records = array_map(function (TeamRecord $record) {
            return sprintf(
                    '%-30s | %2d | %2d | %2d | %2d | %2d',
                    $record->team,
                    $record->matches_played,
                    $record->wins,
                    $record->draws,
                    $record->losses,
                    $record->points
                );
            }, $index);

        return implode("\n", [self::HEADER, ...array_values($printable_records)]);
    }

    private function parseLine(string $line): array
    {
        $split = explode(';', $line);
        if (count($split) !== 3) {
            return [];
        }

        [$home, $away, $result] = $split;
        switch ($result) {
            case GameRecord::WIN:
                return [
                    new GameRecord($home, GameRecord::WIN),
                    new GameRecord($away, GameRecord::LOSS)
                ];
            case GameRecord::LOSS:
                return [
                    new GameRecord($home, GameRecord::LOSS),
                    new GameRecord($away, GameRecord::WIN)
                ];
            case GameRecord::DRAW:
                return [
                    new GameRecord($home, GameRecord::DRAW),
                    new GameRecord($away, GameRecord::DRAW)
                ];
        }
    }

    private static function sortTeamRecords(TeamRecord $a, TeamRecord $b): int
    {
        if ($a->points < $b->points) {
            return 1;
        } elseif ($a->points > $b->points) {
            return -1;
        } elseif ($a->team < $b->team) {
            return -1;
        } elseif ($a->team > $b->team) {
            return 1;
        } else {
            return 0;
        }
    }
}

class GameRecord
{
    public const WIN = 'win';
    public const LOSS = 'loss';
    public const DRAW = 'draw';

    public string $team;
    public string $result;

    public function __construct(string $team, string $result)
    {
        $this->team = $team;
        $this->result = $result;
    }
}

class TeamRecord
{
    public string $team;
    public int $matches_played;
    public int $wins;
    public int $losses;
    public int $draws;
    public int $points;

    public function __construct(string $team)
    {
        $this->team = $team;
        $this->matches_played = 0;
        $this->wins = 0;
        $this->losses = 0;
        $this->draws = 0;
        $this->points = 0;
    }

    public function tallyGameRecord(GameRecord $record): void
    {
        $this->matches_played += 1;
        switch ($record->result) {
            case GameRecord::WIN:
                $this->wins += 1;
                $this->points += 3;
                break;
            case GameRecord::LOSS:
                $this->losses += 1;
                break;
            case GameRecord::DRAW:
                $this->draws += 1;
                $this->points += 1;
                break;
        }
    }
}