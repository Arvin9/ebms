package site.nebulas.beans;

public class Exercises {
	private Integer exercisesId;
	private String exercisesTitle;
	private String exercisesContent;
	private String exercisesAnswer;
	private Integer exercisesDifficultyLevel;//题目难度，1为容易，2为中等，3为困难
	private Integer exercisesIntegral; //习题积分值,1为容易，2为中等，3为困难
	private String exercisesHint;
	
	private Integer answerCount;
	private Integer answerCorrectCount;
	private Integer answerErrorCount;
	
	
	public Integer getExercisesId() {
		return exercisesId;
	}
	public void setExercisesId(Integer exercisesId) {
		this.exercisesId = exercisesId;
	}
	public String getExercisesTitle() {
		return exercisesTitle;
	}
	public void setExercisesTitle(String exercisesTitle) {
		this.exercisesTitle = exercisesTitle;
	}
	public String getExercisesContent() {
		return exercisesContent;
	}
	public void setExercisesContent(String exercisesContent) {
		this.exercisesContent = exercisesContent;
	}
	public String getExercisesAnswer() {
		return exercisesAnswer;
	}
	public void setExercisesAnswer(String exercisesAnswer) {
		this.exercisesAnswer = exercisesAnswer;
	}
	public Integer getExercisesDifficultyLevel() {
		return exercisesDifficultyLevel;
	}
	public void setExercisesDifficultyLevel(Integer exercisesDifficultyLevel) {
		this.exercisesDifficultyLevel = exercisesDifficultyLevel;
	}
	public Integer getExercisesIntegral() {
		return exercisesIntegral;
	}
	public void setExercisesIntegral(Integer exercisesIntegral) {
		this.exercisesIntegral = exercisesIntegral;
	}
	public String getExercisesHint() {
		return exercisesHint;
	}
	public void setExercisesHint(String exercisesHint) {
		this.exercisesHint = exercisesHint;
	}
	public Integer getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(Integer answerCount) {
		this.answerCount = answerCount;
	}
	public Integer getAnswerCorrectCount() {
		return answerCorrectCount;
	}
	public void setAnswerCorrectCount(Integer answerCorrectCount) {
		this.answerCorrectCount = answerCorrectCount;
	}
	public Integer getAnswerErrorCount() {
		return answerErrorCount;
	}
	public void setAnswerErrorCount(Integer answerErrorCount) {
		this.answerErrorCount = answerErrorCount;
	}
	
	
}
