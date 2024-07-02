package models;

public class Ventas {
    private int id;
    private int id_cliente;
    private String cliente;
    private String articulo;
    private int cantidad;
    private double precioTotal;

    public Ventas(int id, int id_cliente, String cliente, String articulo, int cantidad, double precioTotal) {
        this.id = id;
        this.id_cliente = id_cliente;
        this.cliente = cliente;
        this.articulo = articulo;
        this.cantidad = cantidad;
        this.precioTotal = precioTotal;
    }

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

    public String getCliente() {
        return cliente;
    }

    public String getArticulo() {
        return articulo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public double getPrecioTotal() {
        return precioTotal;
    }


	@Override
	public String toString() {
		return "Ventas [id=" + id + ", id_cliente=" + id_cliente + ", cliente=" + cliente + ", articulo=" + articulo
				+ ", cantidad=" + cantidad + ", precioTotal=" + precioTotal + "]";
	}

    
}
