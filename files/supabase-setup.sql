-- ================================================
-- NOVA ACTIVEWEAR · Base de datos Supabase
-- Copia todo esto en SQL Editor y presiona RUN
-- ================================================

-- TABLA DE PRODUCTOS
create table productos (
  id uuid default gen_random_uuid() primary key,
  nombre text not null,
  descripcion text,
  precio numeric not null,
  categoria text default 'Shorts',
  genero text default 'mujer',
  imagen_url text,
  colores text[],
  tallas text[],
  stock integer default 0,
  es_nuevo boolean default false,
  en_oferta boolean default false,
  precio_original numeric,
  created_at timestamp default now()
);

-- TABLA DE PEDIDOS
create table pedidos (
  id uuid default gen_random_uuid() primary key,
  nombre_cliente text not null,
  telefono text,
  email text,
  direccion text,
  items jsonb not null,
  total numeric not null,
  estado text default 'pendiente',
  created_at timestamp default now()
);

-- Seguridad
alter table productos enable row level security;
create policy "Productos publicos" on productos for select using (true);
create policy "Admin productos" on productos for all using (true);

alter table pedidos enable row level security;
create policy "Insertar pedidos" on pedidos for insert with check (true);
create policy "Admin pedidos" on pedidos for all using (true);

-- DATOS MUJER
insert into productos (nombre, descripcion, precio, categoria, genero, colores, tallas, stock, es_nuevo) values
('Short Curve Scrunch', 'Pretina Cruzada | Cintura Alta | Scrunch trasero', 18800, 'Shorts', 'mujer', ARRAY['#8b4513','#2c2c2c','#b0aaa3'], ARRAY['XS','S','M','L','XL'], 15, false),
('Short Aura Cross', 'Pretina Cruzada | Cintura Alta | Fit Medio', 18800, 'Shorts', 'mujer', ARRAY['#b0aaa3','#c0392b','#6b7c4a'], ARRAY['XS','S','M','L'], 20, false),
('Short Flame', 'Scrunch | Alto Impacto | Anti-Transparencia', 19500, 'Shorts', 'mujer', ARRAY['#c0392b','#2c2c2c'], ARRAY['XS','S','M','L','XL'], 10, true),
('Short Onyx', 'Pretina Doble | Cintura Extra Alta | Tiro Largo', 20000, 'Shorts', 'mujer', ARRAY['#2c2c2c','#2c4a7c'], ARRAY['S','M','L'], 8, false),
('Legging Essential', 'Cintura Alta | Anti-Transparencia | Tiro Completo', 22500, 'Leggings', 'mujer', ARRAY['#2c2c2c','#8b4513','#2c4a7c'], ARRAY['XS','S','M','L','XL'], 18, false),
('Legging Sculpt', 'Push Up | Costura Trasera | Ultra Compresión', 24900, 'Leggings', 'mujer', ARRAY['#2c2c2c','#c0392b'], ARRAY['XS','S','M','L'], 12, true),
('Top Bralette Sport', 'Soporte Medio | Tiras Cruzadas | Sin Costuras', 15500, 'Tops', 'mujer', ARRAY['#d4a882','#2c2c2c','#b0aaa3'], ARRAY['XS','S','M','L'], 22, false),
('Camisa Crop Fit', 'Manga Corta | Tela Técnica | Sin Costuras', 14500, 'Camisas', 'mujer', ARRAY['#b0aaa3','#2c2c2c','#c0392b'], ARRAY['XS','S','M','L'], 18, true),
('Set Harmony', 'Legging + Top | Outfit Completo | Tiro Alto', 36000, 'Sets', 'mujer', ARRAY['#8b4513','#2c2c2c'], ARRAY['XS','S','M','L'], 6, true);

-- DATOS HOMBRE
insert into productos (nombre, descripcion, precio, categoria, genero, colores, tallas, stock, es_nuevo) values
('Short Athletic Pro', 'Tiro Medio | Bolsillos Laterales | Secado Rápido', 17500, 'Shorts', 'hombre', ARRAY['#2c2c2c','#2c4a7c','#6b7c4a'], ARRAY['S','M','L','XL','XXL'], 20, false),
('Short Training 5"', 'Tiro Corto | Forro Interior | Alto Rendimiento', 16900, 'Shorts', 'hombre', ARRAY['#2c2c2c','#922b21'], ARRAY['S','M','L','XL'], 15, false),
('Dry Fit Crew', 'Cuello Redondo | Secado Rápido | Anti-Olor', 14000, 'T-Shirts', 'hombre', ARRAY['#2c2c2c','#2c4a7c'], ARRAY['S','M','L','XL'], 12, true),
('Camisa Dry Fit', 'Tejido Técnico | Sin Costuras | Ultra Ligera', 14500, 'T-Shirts', 'hombre', ARRAY['#2c2c2c','#ffffff','#b0aaa3'], ARRAY['S','M','L','XL','XXL'], 25, false),
('Camisa Tank Muscle', 'Amplia | Corte Atlético | Secado Rápido', 13500, 'T-Shirts', 'hombre', ARRAY['#2c2c2c','#2c4a7c','#6b7c4a'], ARRAY['S','M','L','XL'], 18, false),
('Set Training Elite', 'Short + Camisa | Outfit Completo de Alto Rendimiento', 32000, 'Sets', 'hombre', ARRAY['#2c2c2c','#2c4a7c'], ARRAY['S','M','L','XL'], 8, true);
-- Datos de ejemplo - Mujer
insert into productos (nombre, descripcion, precio, categoria, genero, colores, tallas, stock, es_nuevo) values
('Short Curve Scrunch', 'Pretina Cruzada | Cintura Alta | Scrunch trasero', 18800, 'Shorts', 'mujer', ARRAY['#8b4513','#2c2c2c','#b0aaa3'], ARRAY['XS','S','M','L','XL'], 15, false),
('Short Aura Cross', 'Pretina Cruzada | Cintura Alta | Fit Medio', 18800, 'Shorts', 'mujer', ARRAY['#b0aaa3','#c0392b','#6b7c4a'], ARRAY['XS','S','M','L'], 20, false),
('Short Flame', 'Scrunch | Alto Impacto | Anti-Transparencia', 19500, 'Shorts', 'mujer', ARRAY['#c0392b','#2c2c2c'], ARRAY['XS','S','M','L','XL'], 10, true),
('Short Onyx', 'Pretina Doble | Cintura Extra Alta | Tiro Largo', 20000, 'Shorts', 'mujer', ARRAY['#2c2c2c','#2c4a7c'], ARRAY['S','M','L'], 8, false);

-- Datos de ejemplo - Hombre
insert into productos (nombre, descripcion, precio, categoria, genero, colores, tallas, stock, es_nuevo) values
('Short Athletic Pro', 'Tiro Medio | Bolsillos | Secado Rápido', 17500, 'Shorts', 'hombre', ARRAY['#2c2c2c','#2c4a7c','#6b7c4a'], ARRAY['S','M','L','XL','XXL'], 20, false),
('Tight Compression', 'Compresión Alta | Anti-Rozadura | 7/8', 21000, 'Leggings', 'hombre', ARRAY['#2c2c2c','#2c4a7c'], ARRAY['S','M','L','XL'], 12, true),
('Camiseta Dry Fit', 'Tejido Técnico | Sin Costuras | Ligera', 14500, 'Tops', 'hombre', ARRAY['#2c2c2c','#ffffff','#b0aaa3'], ARRAY['S','M','L','XL','XXL'], 25, false),
('Set Training Elite', 'Short + Camiseta | Outfit Completo', 32000, 'Sets', 'hombre', ARRAY['#2c2c2c','#2c4a7c'], ARRAY['S','M','L','XL'], 8, true);
