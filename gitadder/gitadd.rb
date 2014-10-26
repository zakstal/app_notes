def parseres(res)
  text = res[res.index(':')..-1]
  code = res[0..res.index(':')]
  [text, code]
end

def add
  `git add -A`
end

def commit(res)
  puts "hello"
  add
  `git commit -m "#{parseres(res).first}"`
  puts "nello"
end

def log
  `git log`
end

def newgit
  `git init`
end

def newcommit(res)
  newgit
  commit(res)
end

def push
  `git push`
  # needs to check if master is inited
end

def commitpush(res)
  commit(res)
  push
end


while true

  printf '>'
  response = parseres(gets.chomp).last

  case response
  when 'log:'
    log
  when 'c:'
    puts "mlml"
    commit(response)
  when 'new:'
    newgit
  when 'newc:'
    newcommit(response)
  when 'p:'
    push
  when 'cp:'
    commitpush(response)
  end

  exit if response == 'exit:'
end