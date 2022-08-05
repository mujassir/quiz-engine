using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuizEngine.Core.Models
{
    public class Quiz : ModelBase
    {

        [Required(ErrorMessage = "Quiz's title is a required field.")]
        [MaxLength(100, ErrorMessage = "Maximum length for the title is 100 characters.")]
        public string? Title { get; set; }

        public bool? IsPubslished { get; set; }

        public DateTime? PublishedDate { get; set; }

        public string? PubslishedId { get; set; }

        [ForeignKey(nameof(User))]
        public string? UserId { get; set; }

    }
}
