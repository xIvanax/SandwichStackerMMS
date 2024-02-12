import java.io.*;
import java.util.*;

class Highscore {
  String playerName;
  int scoreValue;
  
  Highscore(){}

  Highscore(String playerName, int scoreValue) {
    this.playerName = playerName;
    this.scoreValue = scoreValue;
  }
  
  //učitavanje iz datoteke
  ArrayList<Highscore> loadHighscores() {
    ArrayList<Highscore> scores = new ArrayList<Highscore>();
    String[] lines = loadStrings("data/scores.txt");
    
    if (lines != null) {
      for (String line : lines) {
        String[] parts = line.split(", ");
        if (parts.length == 2) {
          String name = parts[0].trim();
          int points = Integer.parseInt(parts[1].trim());
          Highscore score = new Highscore(name, points);
          scores.add(score);
        }
      }
      scores.sort(Comparator.comparingInt(s -> -s.scoreValue));
    }
    return scores;
  }

  void saveScore(Highscore newScore) {
    ArrayList<Highscore> scores = loadHighscores();
    scores.add(newScore);
    scores.sort(Comparator.comparingInt(s -> -s.scoreValue));
    
    ArrayList<Highscore> topScores = new ArrayList<Highscore>();
    
    if(!scores.isEmpty()){
      for(int i=0; i<scores.size() &&  i<5; i++){
        topScores.add(scores.get(i));
      }
    }
    
    String[] lines = new String[scores.size()];
    for (int i = 0; i < topScores.size(); i++) {
      Highscore score = topScores.get(i);
      lines[i] = score.playerName + ", " + score.scoreValue;
    }
    try {
      saveStrings("data/scores.txt", lines);
    } catch (Exception e) {
      println("Error saving scores: " + e.getMessage());
    }
  }
}
