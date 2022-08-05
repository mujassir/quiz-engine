using System.ComponentModel.DataAnnotations;

namespace QuizEngine.Core.Dtos
{
    public class QuestionDto
    {
        public int Id { get; set; }

        public string? Statement { get; set; }

        public bool? HasMultipleAnswers { get; set; }

        public int QuizId { get; set; }

        public IEnumerable<AnswerDto>? Answers { get; set; }

    }

    public class QuestionCreationDto : QuestionAddUpdateDto
    {
    }

    public class QuestionUpdateDto : QuestionAddUpdateDto
    {
    }

    public abstract class QuestionAddUpdateDto
    {
        [Required(ErrorMessage = "Questions's statement is a required field.")]
        public string? Statement { get; set; }

        public bool? HasMultipleAnswers { get; set; }

        public int QuizId { get; set; }
        public IEnumerable<AnswerDto>? Answers { get; set; }
    }
}
