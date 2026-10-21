-- Cole isto no Supabase: SQL Editor > New query > Run
create table if not exists public.lancamentos (
  id         uuid primary key default gen_random_uuid(),
  criado_em  timestamptz not null default now(),
  nivel      int  not null check (nivel between 1 and 5),
  alcance    numeric,
  visivel    boolean not null default true,   -- desmarque no painel para esconder um registro
  dados      jsonb not null
);

alter table public.lancamentos enable row level security;

-- Qualquer pessoa pode ler os registros visíveis
create policy "leitura publica" on public.lancamentos
  for select using (visivel = true);

-- Qualquer pessoa pode enviar um lançamento novo (sem editar nem apagar)
create policy "envio publico" on public.lancamentos
  for insert with check (visivel = true and nivel between 1 and 5 and pg_column_size(dados) < 8000);
