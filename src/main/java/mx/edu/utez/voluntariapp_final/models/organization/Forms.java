package mx.edu.utez.voluntariapp_final.models.organization;

import java.util.List;

public class Forms {
    private Long id_forms;

    private String name_form;
    private String instructions;
    private Boolean enable;
    private int id_organ;
    private Organ organ ;
    private Event event;
    private  Question question;
    private List <Question> questions;

    public Forms() {
    }

    public Forms(Long id_forms, String name_form, String instructions, Boolean enable, int id_organ, Organ organ, Event event, Question question, List<Question> questions) {
        this.id_forms = id_forms;
        this.name_form = name_form;
        this.instructions = instructions;
        this.enable = enable;
        this.id_organ = id_organ;
        this.organ = organ;
        this.event = event;
        this.question = question;
        this.questions = questions;
    }

    public Long getId_forms() {
        return id_forms;
    }

    public void setId_forms(Long id_forms) {
        this.id_forms = id_forms;
    }

    public String getName_form() {
        return name_form;
    }

    public void setName_form(String name_form) {
        this.name_form = name_form;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }

    public int getId_organ() {
        return id_organ;
    }

    public void setId_organ(int id_organ) {
        this.id_organ = id_organ;
    }

    public Organ getOrgan() {
        return organ;
    }

    public void setOrgan(Organ organ) {
        this.organ = organ;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    @Override
    public String toString() {
        return "Forms{" +
                "id_forms=" + id_forms +
                ", name_form='" + name_form + '\'' +
                ", instructions='" + instructions + '\'' +
                ", enable=" + enable +
                ", id_organ=" + id_organ +
                ", organ=" + organ +
                ", event=" + event +
                ", question=" + question +
                ", questions=" + questions +
                '}';
    }
}
