# AlcantraPET (versão simplificada)

Site de um arquivo só (`index.html`), sem build, sem login. Cadastro por nível (1 a 5), banco público com filtros e CSV, e estatísticas.

## Arquivos
- `index.html`: o site inteiro.
- `config.js`: chaves do banco online (começa vazio = modo demonstração).
- `supabase.sql`: cria a tabela e as regras de acesso público.

## Passo 1: colocar no ar com GitHub Pages (grátis)
1. Crie uma conta em https://github.com.
2. Clique em **New repository**, nomeie como `alcantrapet`, deixe **Public** e crie.
3. Na página do repositório, clique em **Add file > Upload files** e arraste `index.html`, `config.js`, `supabase.sql` e `LEIA-ME.md` (os arquivos, não a pasta). Clique em **Commit changes**.
4. Vá em **Settings > Pages**. Em *Build and deployment*, escolha **Deploy from a branch**, branch `main`, pasta `/ (root)`, e clique em **Save**.
5. Em cerca de 1 minuto o site abre em `https://SEUUSUARIO.github.io/alcantrapet`.

Neste ponto o site já está público, mas em **modo demonstração**: cada visitante só vê os dados salvos no próprio navegador.

## Passo 2: ligar o banco compartilhado (10 minutos, grátis)
1. Crie um projeto em https://supabase.com.
2. Em **SQL Editor > New query**, cole o conteúdo de `supabase.sql` e clique em **Run**.
3. Em **Project Settings > API**, copie a **Project URL** e a chave **anon public**.
4. No GitHub, abra `config.js`, clique no lápis (Edit), cole os dois valores entre as aspas e faça **Commit changes**.
5. Aguarde cerca de 1 minuto e recarregue o site.

Pronto: todo lançamento enviado por qualquer pessoa aparece para todos. A chave `anon public` foi feita para ficar visível; quem protege os dados são as regras do `supabase.sql`. Nunca coloque a chave `service_role` no site.

## Atualizar o site depois
Abra o arquivo no repositório, clique no lápis, altere e faça **Commit changes**. O GitHub guarda o histórico de todas as versões.

## Moderação
No Supabase, em **Table Editor > lancamentos**, desmarque a coluna `visivel` para esconder um registro (spam ou dado pessoal). Ninguém consegue editar nem apagar registros pelo site.

## Domínio próprio (opcional)
Registre em registro.br (ex.: alcantrapet.com.br). No GitHub, em Settings > Pages > Custom domain, informe o domínio e siga as instruções de DNS que o GitHub mostra.

## O que ficou de fora de propósito
Login, contas, modo educador, mapa, API. Dá para adicionar depois sem perder dados, porque cada lançamento guarda seus campos em JSON.
