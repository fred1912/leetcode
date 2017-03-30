public class Solution {
    public List<List<String>> findLadders(String beginWord, String endWord, List<String> wordList) {
        if (beginWord == null || endWord ==null) return null;
        
        if (!wordList.contains(endWord)) return new ArrayList<List<String>>();
        
        Queue<String> q = new LinkedList<String>();
        HashMap<String,List<List<String>>> map = new HashMap<String,List<List<String>>>();
        
        boolean find = false;
        
        int len = beginWord.length();
        List<List<String>> list = new ArrayList<List<String>>();
        
        List<String> path = new ArrayList<String>();
        path.add(beginWord);
        list.add(path);
        
        map.put(beginWord,list);
        q.offer(beginWord);
        
        while (!q.isEmpty()){
            int size = q.size();
            
            HashMap<String,List<List<String>>> TempMap = new HashMap<String,List<List<String>>>();
            for (int i = 0; i<size;i++){
                String str = q.poll();
                for (int j = 0;j<len;j++){
                    StringBuilder sb = new StringBuilder(str);
                    for (char c='a';c<='z';c++){
                        sb.setCharAt(j,c);
                        String temp = sb.toString();
                        if (map.containsKey(temp)||(!wordList.contains(temp)&&!temp.equals(endWord))) continue;
                        List<List<String>> pre = map.get(str);
                        
                        List<List<String>> cur = TempMap.get(temp);
                        if (cur==null){
                            cur = new ArrayList<List<String>>();
                            TempMap.put(temp,cur);
                            q.offer(temp);
                        }
                        for (List<String> pathPre:pre){
                            List<String> pathNew = new ArrayList<String>(pathPre);
                            pathNew.add(temp);
                            cur.add(pathNew);
                        }
                        
                        if (temp.equals(endWord)) find = true; 
                    }
                    
                }
                
            }
            if (find) return TempMap.get(endWord);
            map.putAll(TempMap);
        }
        return new ArrayList<List<String>>();
    }
}
