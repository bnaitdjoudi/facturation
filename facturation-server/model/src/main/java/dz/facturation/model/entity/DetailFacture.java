package dz.facturation.model.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;


/**
 * The persistent class for the detail_facture database table.
 * 
 */
@Entity
@Table(name="detail_facture")
@NamedQuery(name="DetailFacture.findAll", query="SELECT d FROM DetailFacture d")
public class DetailFacture extends AuditTable<Long> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="DETAIL_FACTURE_ID_GENERATOR", sequenceName="DETAIL_FACTURE_ID_SEQ")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="DETAIL_FACTURE_ID_GENERATOR")
	private Long id;

	private BigDecimal duree;

	private BigDecimal mtn;

	private BigDecimal mttc;

	private BigDecimal mtva;

	private BigDecimal pu;

	private BigDecimal qte;

	private BigDecimal remise;

	//bi-directional many-to-one association to Article
	@ManyToOne
	@JoinColumn(name="idarticle")
	private Article article;

	//bi-directional many-to-one association to Facture
	@ManyToOne
	@JoinColumn(name="idfacture")
	private Facture facture;

	//bi-directional many-to-one association to Taux
	@ManyToOne
	@JoinColumn(name="idttv")
	private Taux taux1;

	//bi-directional many-to-one association to Taux
	@ManyToOne
	@JoinColumn(name="idtr")
	private Taux taux2;

	public DetailFacture() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getDuree() {
		return this.duree;
	}

	public void setDuree(BigDecimal duree) {
		this.duree = duree;
	}

	public BigDecimal getMtn() {
		return this.mtn;
	}

	public void setMtn(BigDecimal mtn) {
		this.mtn = mtn;
	}

	public BigDecimal getMttc() {
		return this.mttc;
	}

	public void setMttc(BigDecimal mttc) {
		this.mttc = mttc;
	}

	public BigDecimal getMtva() {
		return this.mtva;
	}

	public void setMtva(BigDecimal mtva) {
		this.mtva = mtva;
	}

	public BigDecimal getPu() {
		return this.pu;
	}

	public void setPu(BigDecimal pu) {
		this.pu = pu;
	}

	public BigDecimal getQte() {
		return this.qte;
	}

	public void setQte(BigDecimal qte) {
		this.qte = qte;
	}

	public BigDecimal getRemise() {
		return this.remise;
	}

	public void setRemise(BigDecimal remise) {
		this.remise = remise;
	}

	public Article getArticle() {
		return this.article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Facture getFacture() {
		return this.facture;
	}

	public void setFacture(Facture facture) {
		this.facture = facture;
	}

	public Taux getTaux1() {
		return this.taux1;
	}

	public void setTaux1(Taux taux1) {
		this.taux1 = taux1;
	}

	public Taux getTaux2() {
		return this.taux2;
	}

	public void setTaux2(Taux taux2) {
		this.taux2 = taux2;
	}

}