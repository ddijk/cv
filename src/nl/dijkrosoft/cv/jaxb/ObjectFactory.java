//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 in JDK 6 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2011.11.20 at 12:19:23 PM CET 
//


package nl.dijkrosoft.cv.jaxb;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the nl.dijkrosoft.cv.jaxb package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _Cv_QNAME = new QName("", "cv");
    private final static QName _Comment_QNAME = new QName("", "comment");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: nl.dijkrosoft.cv.jaxb
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link PersonaliaType }
     * 
     */
    public PersonaliaType createPersonaliaType() {
        return new PersonaliaType();
    }

    /**
     * Create an instance of {@link OpleidingType }
     * 
     */
    public OpleidingType createOpleidingType() {
        return new OpleidingType();
    }

    /**
     * Create an instance of {@link OpdrachtenType }
     * 
     */
    public OpdrachtenType createOpdrachtenType() {
        return new OpdrachtenType();
    }

    /**
     * Create an instance of {@link ContactPersoonType }
     * 
     */
    public ContactPersoonType createContactPersoonType() {
        return new ContactPersoonType();
    }

    /**
     * Create an instance of {@link ItemType }
     * 
     */
    public ItemType createItemType() {
        return new ItemType();
    }

    /**
     * Create an instance of {@link OpleidingenType }
     * 
     */
    public OpleidingenType createOpleidingenType() {
        return new OpleidingenType();
    }

    /**
     * Create an instance of {@link CvType }
     * 
     */
    public CvType createCvType() {
        return new CvType();
    }

    /**
     * Create an instance of {@link ContactPersonenType }
     * 
     */
    public ContactPersonenType createContactPersonenType() {
        return new ContactPersonenType();
    }

    /**
     * Create an instance of {@link KlantType }
     * 
     */
    public KlantType createKlantType() {
        return new KlantType();
    }

    /**
     * Create an instance of {@link ErvaringenType }
     * 
     */
    public ErvaringenType createErvaringenType() {
        return new ErvaringenType();
    }

    /**
     * Create an instance of {@link OpdrachtType }
     * 
     */
    public OpdrachtType createOpdrachtType() {
        return new OpdrachtType();
    }

    /**
     * Create an instance of {@link AdresType }
     * 
     */
    public AdresType createAdresType() {
        return new AdresType();
    }

    /**
     * Create an instance of {@link PeriodeType }
     * 
     */
    public PeriodeType createPeriodeType() {
        return new PeriodeType();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CvType }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "cv")
    public JAXBElement<CvType> createCv(CvType value) {
        return new JAXBElement<CvType>(_Cv_QNAME, CvType.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "comment")
    public JAXBElement<String> createComment(String value) {
        return new JAXBElement<String>(_Comment_QNAME, String.class, null, value);
    }

}
