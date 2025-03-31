package entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;
import java.util.Date;

@Entity
@Table(name = "annonces")  // Préférer un nom au pluriel
public class Annonce {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title", nullable = false, length = 100)
    @Size(min = 3, max = 100)
    private String title;

    @Column(name = "description", columnDefinition = "TEXT")
    @Lob  // Pour les longs textes
    private String description;

    @Column(name = "address")  // Correction orthographique
    private String adresse;

    @Column(name = "email", nullable = false)
    @Email
    private String email;

    @Column(name = "creation_date", updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date dateCreation;

    @Version
    private int version;

    public Annonce() {

    }

    public Annonce(String title, String description, String adresse, String email) {
        this.title = title;
        this.description = description;
        this.adresse = adresse;
        this.email = email;
    }

    // Gets

    public Long getId() {
        return id;
    }

    public @Size(min = 3, max = 100) String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getAdresse() {
        return adresse;
    }

    public @Email String getEmail() {
        return email;
    }

    public Date getDateCreation() {
        return dateCreation;
    }

    public int getVersion() {
        return version;
    }


    // Sets

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(@Size(min = 3, max = 100) String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public void setEmail(@Email String email) {
        this.email = email;
    }

    public void setDateCreation(Date dateCreation) {
        this.dateCreation = dateCreation;
    }

    public void setVersion(int version) {
        this.version = version;
    }

}
