

create function PrecioCaja
(
	@Param1 numeric(18,2),
	@Param2 int
)
returns numeric(18,2)
as
begin
	declare @resultado numeric(18,2)

	select @resultado = @Param1 * @Param2

	return @resultado

end