package com.atomicaxis.ctlg_app.domain;

import com.atomicaxis.ctlg_app.common.LeadSource;
import com.atomicaxis.ctlg_app.common.Status;
import flexjson.JSONSerializer;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class ContactRecord {

    @NotNull
    @Size(min = 2, max = 30)
    private String firstName;

    @NotNull
    @Size(min = 2, max = 30)
    private String lastName;

    private String partnerFirstName;

    private String partnerLastName;

    private String firstPersonEmailAddress;

    private String partnerEmailAddress;

    private String cellPhone;

    private String homePhone;

    private String workPhone;

    private String addressLine1;

    private String city;

    private String state;

    private Long zip;

    private String name;

    @OneToMany(cascade = CascadeType.ALL,mappedBy="contactRecord",fetch=FetchType.EAGER)
    private Set<ActionPlan> actionPlans = new HashSet<ActionPlan>();

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Note> notes = new HashSet<Note>();

    @Enumerated
    private Status status;

    @Enumerated
    private LeadSource leadSource;

    public String getName() {
        return this.firstName + " " + lastName;
    }

    //JSON serializer (Covert From ContactRecord to JSON Array
	public static String toJsonArray(Collection<ContactRecord> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
}
